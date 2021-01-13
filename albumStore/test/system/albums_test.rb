require "application_system_test_case"

class AlbumsTest < ApplicationSystemTestCase
  setup do
    @album = albums(:one)
  end

  test "visiting the index" do
    visit albums_url
    assert_selector "h1", text: "Albums"
  end

  test "creating a Album" do
    visit albums_url
    click_on "New Album"

    fill_in "Description", with: @album.description
    fill_in "Genre", with: @album.genre_id
    fill_in "Musician", with: @album.musician_id
    fill_in "Name", with: @album.name
    fill_in "Pic", with: @album.pic
    fill_in "Price", with: @album.price
    fill_in "Region", with: @album.region_id
    fill_in "Sales", with: @album.sales
    fill_in "Stock", with: @album.stock
    click_on "Create Album"

    assert_text "Album was successfully created"
    click_on "Back"
  end

  test "updating a Album" do
    visit albums_url
    click_on "Edit", match: :first

    fill_in "Description", with: @album.description
    fill_in "Genre", with: @album.genre_id
    fill_in "Musician", with: @album.musician_id
    fill_in "Name", with: @album.name
    fill_in "Pic", with: @album.pic
    fill_in "Price", with: @album.price
    fill_in "Region", with: @album.region_id
    fill_in "Sales", with: @album.sales
    fill_in "Stock", with: @album.stock
    click_on "Update Album"

    assert_text "Album was successfully updated"
    click_on "Back"
  end

  test "destroying a Album" do
    visit albums_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Album was successfully destroyed"
  end
end
