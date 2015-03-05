require 'spec_helper.rb'

feature "Looking up invoices", js: true do
  scenario "finding invoices" do
    visit '/'
    fill_in "keywords", with: "it"
    click_on "Search"

    expect(page).to have_content("It consulting")
    expect(page).not_to have_content("Server maintenance")
  end
end