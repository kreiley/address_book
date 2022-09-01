class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]
  before_action :require_current_user

  # GET /people or /people.json
  def index
    @people = current_user.people.order(Person.arel_table['last_name'].lower.asc, Person.arel_table['first_name'].lower.asc)
  end

  # GET /people/1 or /people/1.json
  def show
    @emails = @person.emails.order(created_at: :desc)
    @phones = @person.phones.order(created_at: :desc)
    @addresses = @person.addresses.order(created_at: :desc)
  end

  # GET /people/new
  def new
    @person = Person.new
    @person.addresses.build
    @person.emails.build
    @person.phones.build
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    #@person = Person.new(person_params)
    @person = current_user.people.new(person_params)
    @person.user = current_user

    respond_to do |format|
      if @person.save
        #format.turbo_stream
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        #format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@person)}_form"), partial: "form", locals: {person: @person}}
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = current_user.people.find(params[:id])
      
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(
        :salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date, :comment, :slug, :user_id,
        addresses_attributes: [:id, :street, :town, :zip_code, :state, :country, :person, :_destroy],
        emails_attributes: [:id, :email_address, :comment, :person, :_destroy],
        phones_attributes: [:id, :phone_number, :comment, :person, :_destroy])
    end
end
