require "application_system_test_case"

class TransactionOrdersTest < ApplicationSystemTestCase
  setup do
    @transaction_order = transaction_orders(:one)
  end

  test "visiting the index" do
    visit transaction_orders_url
    assert_selector "h1", text: "Transaction Orders"
  end

  test "creating a Transaction order" do
    visit transaction_orders_url
    click_on "New Transaction Order"

    fill_in "Amount", with: @transaction_order.amount
    fill_in "Delivery address", with: @transaction_order.delivery_address
    fill_in "Delivery name", with: @transaction_order.delivery_name
    fill_in "Delivery phone", with: @transaction_order.delivery_phone
    fill_in "Delivery postcode", with: @transaction_order.delivery_postcode
    fill_in "Delivery state", with: @transaction_order.delivery_state
    fill_in "Transaction item", with: @transaction_order.transaction_item_id
    fill_in "User", with: @transaction_order.user_id
    click_on "Create Transaction order"

    assert_text "Transaction order was successfully created"
    click_on "Back"
  end

  test "updating a Transaction order" do
    visit transaction_orders_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @transaction_order.amount
    fill_in "Delivery address", with: @transaction_order.delivery_address
    fill_in "Delivery name", with: @transaction_order.delivery_name
    fill_in "Delivery phone", with: @transaction_order.delivery_phone
    fill_in "Delivery postcode", with: @transaction_order.delivery_postcode
    fill_in "Delivery state", with: @transaction_order.delivery_state
    fill_in "Transaction item", with: @transaction_order.transaction_item_id
    fill_in "User", with: @transaction_order.user_id
    click_on "Update Transaction order"

    assert_text "Transaction order was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction order" do
    visit transaction_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction order was successfully destroyed"
  end
end
