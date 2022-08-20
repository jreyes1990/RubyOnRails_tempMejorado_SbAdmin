require "application_system_test_case"

class PersonasAreasTest < ApplicationSystemTestCase
  setup do
    @personas_area = personas_areas(:one)
  end

  test "visiting the index" do
    visit personas_areas_url
    assert_selector "h1", text: "Personas Areas"
  end

  test "creating a Personas area" do
    visit personas_areas_url
    click_on "New Personas Area"

    fill_in "Area", with: @personas_area.area_id
    fill_in "Estado", with: @personas_area.estado
    fill_in "Persona", with: @personas_area.persona_id
    fill_in "User created", with: @personas_area.user_created_id
    fill_in "User updated", with: @personas_area.user_updated_id
    click_on "Create Personas area"

    assert_text "Personas area was successfully created"
    click_on "Back"
  end

  test "updating a Personas area" do
    visit personas_areas_url
    click_on "Edit", match: :first

    fill_in "Area", with: @personas_area.area_id
    fill_in "Estado", with: @personas_area.estado
    fill_in "Persona", with: @personas_area.persona_id
    fill_in "User created", with: @personas_area.user_created_id
    fill_in "User updated", with: @personas_area.user_updated_id
    click_on "Update Personas area"

    assert_text "Personas area was successfully updated"
    click_on "Back"
  end

  test "destroying a Personas area" do
    visit personas_areas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personas area was successfully destroyed"
  end
end
