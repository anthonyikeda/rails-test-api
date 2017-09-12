class AddressController < ApplicationController
    before_action :set_address, only: [:show, :update, :destroy]

    def index
        @addresses = Address.find(params[:user_id])
        json_response(@addresses)
    end

    def create
        @address = Address.create!(address_params)
        json_response(@address, :created)
    end

    def show
        json_response(@address)
    end

    def update
        @address.update(address_params)
        head :no_content
    end

    def destroy
        @address.destroy
        head :no_content
    end

    private
        def address_params
            params.permit(:user_id, :street_1, :street_2, :city, :state, :zip)
        end

        def set_address
            @address = Address.find(params[:id])
        end
end
