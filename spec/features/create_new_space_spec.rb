feature "create spaces" do
  scenario "create new space" do
    visit '/spaces/new'
    fill_in :name, with: "Commercial Road"
    fill_in :description, with: "Tidy little place"
    fill_in :price, with: 100
    expect{click_button("create space")}.to change(Space, :count).by 1
    expect(current_path).to eq '/'
    within "ul#spaces" do
      expect(page).to have_content "Commercial Road"
      expect(page).to have_content "Tidy little place"
      expect(page).to have_content "Cost per night £100"
    end
  end

end
