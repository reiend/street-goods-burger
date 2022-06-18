# frozen_string_literal: true

# StoreValidations module

module StoreValidations
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    has_many :store_customers
    has_many :store_admins
    has_many :foods

    validates :store_name, :address, presence: true, uniqueness: true
    validates :store_name, length: { minimum: 1, maximum: 64 }
    validates :address,    length: { minimum: 1, maximum: 128 }
  end
end