module FeatureHelpers
 module Authentication

   def i_sign_in_as_admin
    admin = create(:user, email: 'admin@test.com', password: '12345678', password_confirmation: '12345678')
    visit root_path
    fill_in 'Email', with: 'admin@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
   end
 end
end
