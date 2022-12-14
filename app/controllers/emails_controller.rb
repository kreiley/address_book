class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]
  before_action :require_current_user


  # GET /emails or /emails.json
  def index
    @emails = current_user.emails
  end

  # GET /emails/1 or /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails or /emails.json
  def create
    @person = Person.find(params[:person_id])
    @email = @person.emails.create(email_params)
    @email.user = current_user

    respond_to do |format|
      if @email.save
        #format.turbo_stream
        format.html { redirect_to person_path(@person), notice: "Email was successfully created." }
        format.json { render :show, status: :created, location: @email }
      else
        #format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@email)}_form"), partial: "form", locals: {email: @email}}
        format.html { redirect_to person_path(@person), alert: "Email was not created." }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to person_path(@person), notice: "Email was successfully updated." }
        format.json { render :show, status: :ok, location: @email }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@email)}_form"), partial: "form", locals: {email: @email}}
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email = @person.emails.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to person_path(@person), notice: "Email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @person = Person.find(params[:person_id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:email_address, :comment, :person_id)
    end
end
