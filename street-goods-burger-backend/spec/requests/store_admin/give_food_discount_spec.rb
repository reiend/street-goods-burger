require 'rails_helper'

RSpec.describe 'StoreAdmin/GiveFoodDiscount Controller', type: :request do
  before(:each) do
    @store = FactoryBot.create :store
    @store_admin = @store.store_admins.create!(
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password
    )

    @store_admin.confirm

    sign_in @store_admin
  end

  describe 'Put' do
    describe 'store_admin/give_food_discount' do
      let(:give_food_discount_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        put '/store_admin/give_food_discount', params: {
          data: {
            food_id: -1
          }
        }
      end

      it '1, invalid params info should raise an error' do
        expect(give_food_discount_info['status']).to (be == 400).or(be == 422)
      end
    end
  end
end
