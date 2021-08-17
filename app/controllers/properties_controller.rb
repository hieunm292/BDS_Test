class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_sidebar, except: [:show]


  def index
    @properties = Property.all
  end

  def show
    @agent = @property.account
    @agent_properties = Property.where(account_id: @agent.id).where.not(id: @property.id)
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def create
    @property = current_account.properties.build(property_params)
    @property.photo.attach(params[:property][:photo])
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def set_sidebar
    @show_sidebar = true
  end

  def property_params
    params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :details,
                                     :for_sale, :available_date, :parking_spaces, :photo)
  end
end
