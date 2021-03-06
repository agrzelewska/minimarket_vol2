class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Customer < ActiveRecord::Base
 validates :name, :email, presence: true
 validates :email, uniqueness: true, email: true
 has_many :offers
end
