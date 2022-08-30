require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "should create person" do
    visit people_url
    click_on "New person"

    fill_in "Birth date", with: @person.birth_date
    fill_in "Comment", with: @person.comment
    fill_in "First name", with: @person.first_name
    fill_in "Last name", with: @person.last_name
    fill_in "Middle name", with: @person.middle_name
    fill_in "Salutation", with: @person.salutation
    fill_in "Slug", with: @person.slug
    fill_in "Ssn", with: @person.ssn
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Edit this person", match: :first

    fill_in "Birth date", with: @person.birth_date
    fill_in "Comment", with: @person.comment
    fill_in "First name", with: @person.first_name
    fill_in "Last name", with: @person.last_name
    fill_in "Middle name", with: @person.middle_name
    fill_in "Salutation", with: @person.salutation
    fill_in "Slug", with: @person.slug
    fill_in "Ssn", with: @person.ssn
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "should destroy Person" do
    visit person_url(@person)
    click_on "Destroy this person", match: :first

    assert_text "Person was successfully destroyed"
  end
end
