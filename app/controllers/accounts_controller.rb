class AccountsController < ApplicationController
  before_action :load_account, only: [:show, :edit]
  before_action :set_sidebar, only: [:show]

  def show
    @agent = @account
    @agent_properties = Property.where(account_id: @agent.id)
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

  def set_sidebar
    @show_sidebar = true
  end

  def load_account
    @account = Account.find_by id: params[:id]
    return if @account

    flash[:warning] = ".user_not_found"
    redirect_to root_path
  end

  def account_params
    params.require(:account)
          .permit(:last_name,:first_name, :email, :telephone, :company, :password, :password_confirmation)
  end
end
