require 'rails_helper'

RSpec.describe 'StoreCustomer/CancelOrder Controller', type: :request do
  before(:each) do
    @store = FactoryBot.create :store
    @store_customer = @store.store_customers.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password
    )

    @store_customer.confirm

    sign_in @store_customer
  end

  describe 'Put' do
    describe 'store_customer/cancel_order' do
      let(:cancel_order_info) do
        JSON.parse(response.body)
      end
      before(:each) do
        put '/store_customer/cancel_order', params: {
          cancel_order_info: {
            store_transaction_id: -1
          }
        }
      end

      it '1, if can\'t find store transaction should raise an error' do
        expect(cancel_order_info['status']).to be == 422
      end
    end
  end
end
