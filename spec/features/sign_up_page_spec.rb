feature 'sign up' do
    scenario 'a user can sign up' do
        visit '/sign_up'
        fill_in('username', with: 'test2@mail.com')

        fill_in('password', with: 'password123')
        click_button('Sign Up')
        fill_in('username', with: 'test2@mail.com')

        fill_in('password', with: 'password123')
        click_button('Sign In')
        expect(page).to have_content('test2@mail.com')
    end
end