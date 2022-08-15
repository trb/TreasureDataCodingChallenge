# Simple Recipe API

A simple api to manage recipes and ingredients.

# Design decisions

**No authentication** - the small scope of this project requires trade-offs, and proper authentication
often has edge cases. For future development, I'd recommend token-based authentication using something
like [`devise_token_auth`](https://github.com/lynndylanhurley/devise_token_auth). It supports many
security features like short timeouts on token, CSRF protection, CORS management - all things a proper
auth system should handle.

**SQLite3** - no need for a server-based RDBMS on a small project. Sqlite3 can support quite a lot of
use, and there's tools like [Litestream]() and [rqlite]() that can add backup/multi-node support to
sqlite3 if needed. Switching to Postgresql (or another database) is also possible the future, although
sqlite3 can go a long way.

**Serialization** - I chose the strictest serialization format that sqlite3 supports. I strongly believe
software should be reliable, even small projects should treat customer data very carefully. Due to the
small scope I won't implement transaction retries, if there's a conflict the writes will just fail and
it'd be up to the client to retry. For a production system, I'd add transaction retries if the
transaction fails due to serialization errors.

**Simple API schema** - to reduce the scope of this work, ingredients won't get a separate api endpoint
to manage them. Ingredients will be an array in the create-recipe payload, and individual ingredient
entries in the database will be matched simply by name. If no ingredient with the name is found, a new
ingredient is created.