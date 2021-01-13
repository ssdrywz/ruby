require "application_system_test_case"

class TransactionItemsTest < ApplicationSystemTestCase
  setup do
    @transaction_item = transaction_items(:one)
  end

  test "visiting the index" do
    visit transaction_items_url
    assert_selector "h1", text: "Transaction Items"
  end

  test "creating a Transaction item" do
    visit transaction_items_url
    click_on "New Transaction Item"

    fill_in "Album", with: @transaction_item.album_id
    fill_in "Number", with: @transaction_item.number
    fill_in "Price", with: @transaction_item.price
    fill_in "User", with: @transaction_item.user_id
    click_on "Create Transaction item"

    assert_text "Transaction item was successfully created"
    click_on "Back"
  end

  test "updating a Transaction item" do
    visit transaction_items_url
    click_on "Edit", match: :first

    fill_in "Album", with: @transaction_item.album_id
    fill_in "Number", with: @transaction_item.number
    fill_in "Price", with: @transaction_item.price
    fill_in "User", with: @transaction_item.user_id
    click_on "Update Transaction item"

    assert_text "Transaction item was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction item" do
    visit transaction_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction item was successfully destroyed"
  end
end
