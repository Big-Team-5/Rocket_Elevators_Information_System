require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "creating a Customer" do
    visit customers_url
    click_on "New Customer"

    fill_in "Full name of the compagny contact", with: @customer.Full_Name_of_the_compagny_contact
    fill_in "Full name of the technical authority", with: @customer.Full_name_of_the_technical_authority
    fill_in "Userid", with: @customer.UserId
    fill_in "Compagny name", with: @customer.compagny_Name
    fill_in "Compagny contact number", with: @customer.compagny_contact_number
    fill_in "Compagny description", with: @customer.compagny_description
    fill_in "Compagny headquarter address", with: @customer.compagny_headquarter_address
    fill_in "Email of the compagny contact", with: @customer.email_of_the_compagny_contact
    fill_in "Technical authority phone for service", with: @customer.technical_authority_phone_for_service
    fill_in "Technical manager email for service", with: @customer.technical_manager_email_for_service
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "updating a Customer" do
    visit customers_url
    click_on "Edit", match: :first

    fill_in "Full name of the compagny contact", with: @customer.Full_Name_of_the_compagny_contact
    fill_in "Full name of the technical authority", with: @customer.Full_name_of_the_technical_authority
    fill_in "Userid", with: @customer.UserId
    fill_in "Compagny name", with: @customer.compagny_Name
    fill_in "Compagny contact number", with: @customer.compagny_contact_number
    fill_in "Compagny description", with: @customer.compagny_description
    fill_in "Compagny headquarter address", with: @customer.compagny_headquarter_address
    fill_in "Email of the compagny contact", with: @customer.email_of_the_compagny_contact
    fill_in "Technical authority phone for service", with: @customer.technical_authority_phone_for_service
    fill_in "Technical manager email for service", with: @customer.technical_manager_email_for_service
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer" do
    visit customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer was successfully destroyed"
  end
end
