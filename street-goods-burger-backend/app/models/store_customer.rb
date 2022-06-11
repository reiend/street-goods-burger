class StoreCustomer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :store
  has_many :favorite_foods
  has_many :personal_discounts

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable,
         :registerable,
         :validatable,
         :recoverable,
         :confirmable,
         :rememberable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self
end
