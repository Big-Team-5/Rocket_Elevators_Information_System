require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { Full_Name_of_the_compagny_contact: @customer.Full_Name_of_the_compagny_contact, Full_name_of_the_technical_authority: @customer.Full_name_of_the_technical_authority, UserId: @customer.UserId, compagny_Name: @customer.compagny_Name, compagny_contact_number: @customer.compagny_contact_number, compagny_description: @customer.compagny_description, compagny_headquarter_address: @customer.compagny_headquarter_address, email_of_the_compagny_contact: @customer.email_of_the_compagny_contact, technical_authority_phone_for_service: @customer.technical_authority_phone_for_service, technical_manager_email_for_service: @customer.technical_manager_email_for_service } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { Full_Name_of_the_compagny_contact: @customer.Full_Name_of_the_compagny_contact, Full_name_of_the_technical_authority: @customer.Full_name_of_the_technical_authority, UserId: @customer.UserId, compagny_Name: @customer.compagny_Name, compagny_contact_number: @customer.compagny_contact_number, compagny_description: @customer.compagny_description, compagny_headquarter_address: @customer.compagny_headquarter_address, email_of_the_compagny_contact: @customer.email_of_the_compagny_contact, technical_authority_phone_for_service: @customer.technical_authority_phone_for_service, technical_manager_email_for_service: @customer.technical_manager_email_for_service } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
