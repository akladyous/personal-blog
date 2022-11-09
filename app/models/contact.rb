class Contact
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  include ActiveModel::Validations

  attr_accessor :name, :email, :subject, :message

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  validates_presence_of :name, :email, :subject, :message
  # validates_length_of :name, { minimum: 10 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def persisted?
    false
  end
end
