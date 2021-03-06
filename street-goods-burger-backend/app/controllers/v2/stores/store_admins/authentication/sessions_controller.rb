# frozen_string_literal: true

module V2
  module Stores
    module StoreAdmins
      module Authentication
        class SessionsController < Devise::SessionsController
          respond_to :json

          private

          def respond_with(resource, _opts = {})
            render json: {
              status: { code: 200, message: 'Logged in sucessfully.' },
              data: StoreAdminSerializer.new(resource).serializable_hash[:data][:attributes]
            }, status: :ok
          end

          def respond_to_on_destroy
            render json: {
              status: 200,
              message: 'signout out successfully'
            }, status: :ok
          end
        end
      end
    end
  end
end
