require 'rails_helper'

RSpec.feature "user can login account from home" do
  scenario "I see my dashboard" do

    db_repo = FactoryJordan.new
    user = db_repo.create_users(1)[0]

    visit '/'

    click_link "Login"

    expect(current_path).to eq login_path

    fill_in "Username", with: "jlawlz"
    fill_in "Password", with: "password"

    click_button "Submit"

    user = User.find_by(username: 'jlawlz')

    expect(current_path).to eq dashboard_path

    expect(page).to have_content "Logged in as Jordan"
    expect(page).to_not have_content "Login"
    expect(page).to have_content "Logout"
  end
end