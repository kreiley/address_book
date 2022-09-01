class PhonesController < ApplicationController
  before_action :set_phone, only: %i[ show edit update destroy ]
  before_action :require_current_user


  # GET /phones or /phones.json
  def index
    @phones = current_user.phones
  end

  # GET /phones/1 or /phones/1.json
  def show
  end

  # GET /phones/new
  def new
    @phone = Phone.new
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones or /phones.json
  def create
    @person = Person.find(params[:person_id])
    @phone = @person.phones.create(phone_params)
    @phone.user = current_user

    respond_to do |format|
      if @phone.save
        #format.turbo_stream
        format.html { redirect_to person_path(@person), notice: "Phone was successfully created." }
        format.json { render :show, status: :created, location: @phone }
      else
        #format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@email)}_form"), partial: "form", locals: {email: @email}}
        format.html { redirect_to person_path(@person), alert: "Phone was not created." }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1 or /phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to person_path(@person), notice: "Phone was successfully updated." }
        format.json { render :show, status: :ok, location: @phone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1 or /phones/1.json
  def destroy
    @phone = @person.phones.find(params[:id])
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to person_path(@person), notice: "Phone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @person = Person.find(params[:person_id])
    end

    # Only allow a list of trusted parameters through.
    def phone_params
      params.require(:phone).permit(:phone_number, :comment, :person_id)
    end
end
