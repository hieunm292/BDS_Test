class AccountsController < ApplicationController
  def show
    @account = Account.find_by id: params[:id]
    return if @account

    flash[:warning] = ".user_not_found"
    redirect_to root_path
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new account_params
    if @account.save
      flash[:success] =  ".create_user_success"
      redirect_to @account
    else
      render :blog
    end
  end

  private

  def account_params
    params.require(:account)
          .permit(:last_name,:first_name, :email, :company, :password, :password_confirmation)
  end
end
