from urllib import request, parse
import json
import sys

def send(url, data=None, method='POST'):
    if data is not None:
        data = str(json.dumps(data)).encode('utf-8')
        req = request.Request(url, data=data, method=method)
    else:
        req = request.Request(url)
    req.add_header('content-type', 'application/json')
    response = request.urlopen(req)
    return json.loads(response.read())

user_uuid = send('http://localhost:5000/users', {
    'name': 'Bob',
    'email': 'bob@example.com'
})['uuid']

data = {
    "user": user_uuid,
    "name": "Awesome Chili",
    "description": "This is my awesome chili recipe - careful hot!",
    "process": "Fry the meat, cut up the veggies, put it all in a big pot and boil for 2 hours",
    "ingredients": [
        {
            "name": "Lean ground beef",
            "amount": "1 pound"
        },
        {
            "name": "Tomatoes",
            "amount": "5"
        },
        {
            "name": "Onion",
            "amount": "1"
        },
        {
            "name": "Pepper",
            "amount": "5g"
        },
        {
            "name": "Water",
            "amount": "0.25l"
        }
    ]
}
recipe_uuid = send('http://localhost:5000/recipes', data)['uuid']

res = send('http://localhost:5000/ratings', {
    "user_uuid": user_uuid,
    "recipe_uuid": recipe_uuid,
    "rating": 5
})

recipe = send('http://localhost:5000/recipes/{}'.format(recipe_uuid))
if len(recipe['ratings']) < 1:
    print('Saving ratings failed')
    sys.exit(1)

recipe = send('http://localhost:5000/recipes/{}?unit=imperial'.format(recipe_uuid))
ingredients = [ingredient['ingredient'] for ingredient in recipe['ingredients'] if ingredient['ingredient']['measurement_type'] == 'weight']
if not 'oz' in ingredients[0]['amount']:
    print('Retrieving recipe in imperial units failed')
    sys.exit(1)

recipes = send('http://localhost:5000/recipes')

data = {
    "name": "Bobs great chili",
    "description": "It's really good",
    "process": "Just mash everything together and microwave it",
    "ingredients": [
        {
            "name": "Bananas",
            "amount": "5"
        },
        {
            "name": "Onions",
            "amount": "10kg"
        }
    ]
}
recipe = send('http://localhost:5000/recipes/{}'.format(recipe_uuid), data, method='PUT')
if len(recipe['ingredients']) != 2:
    print('Updating recipe failed')
    sys.exit(1)

req = request.Request('http://localhost:5000/recipes/{}'.format(recipe_uuid), method='DELETE')
response = request.urlopen(req)

sys.exit(0)