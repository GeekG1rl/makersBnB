require 'tilt/erb'

feature "registering" do
  scenario "creating an account" do
    visit '/users/new'
    expect(page.status_code).to eq 200
      fill_in :first_name, with: "Alice"
      fill_in :last_name, with: "Cooper"
      fill_in :email, with: "rock4life@gmail.com"
      fill_in :password, with: "rocking"
      fill_in :password_confirm, with: "rocking"
    expect{click_button "Create Account"}.to change(User, :count).by 1
    expect(current_path).to eq '/'
    expect(page).to have_content "Logged in as: Alice Cooper"
  end
end
