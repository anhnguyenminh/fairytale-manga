# frozen_string_literal:true

class V1::AccountsController < ApplicationController
  def create_table
    @account = current_user.account.build(account_params)

    if @account.save
      render :create, status: :created
    else
      head(:unprocessable_entity)
    end
  
  end

  def update
    @account = current_user.accounts.find(params[:id])
    if @account.update(account_params)
      render :update
    else
      head(:unprocessable_entity)
    end
  end

  private
    def account_params
      params.require(:account).permit(:name, :address, :vat_rate, :tax_payer_id, :default_currency)
    end
end
