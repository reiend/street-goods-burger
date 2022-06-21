# frozen_string_literal: true

# StoreAdmin::BanStoreCustomerController Template
class StoreAdmin::BanStoreCustomerController < StoreAdmin::StoreAdminController
  def update
    store_customer_id = ban_store_customer_params[:store_customer_id]

    ban_store_customer_info = current_store_admin
                              .ban_store_customer(store_customer_id:)

    render json: ban_store_customer_info
  end

  private

  def ban_store_customer_params
    params
      .require(:data)
      .permit(
        :store_customer_id
      )
  end
end