module UseUuid
  extend ActiveSupport::Concern

  included do
    before_save :generate_uuid
  end

  def generate_uuid
    self.uuid = SecureRandom.uuid unless self.uuid
  end
end