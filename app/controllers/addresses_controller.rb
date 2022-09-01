class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :require_current_user


  # GET /addresses or /addresses.json
  def index
    @addresses = current_user.addresses
  end

  # GET /addresses/1 or /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses or /addresses.json
  def create
    @person = Person.find(params[:person_id])
    @address = @person.addresses.create(address_params)
    @address.user = current_user

    respond_to do |format|
      if @address.save
        #format.turbo_stream
        format.html { redirect_to person_path(@person), notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        #format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@email)}_form"), partial: "form", locals: {email: @email}}
        format.html { redirect_to person_path(@person), alert: "Address was not created." }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to person_path(@person), notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        #format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@address)}_form"), partial: "form", locals: {address: @address}}
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address = @person.addresses.find(params[:id])
    @address.destroy
    respond_to do |format|
      format.html { redirect_to person_path(@person), notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @person = Person.find(params[:person_id])

    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:street, :town, :zip_code, :state, :country, :person_id)
    end
end
