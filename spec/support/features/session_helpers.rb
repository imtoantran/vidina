module Features
  module SessionHelpers
    # :nocov:
    def sign_up(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      
      click_button 'Sign Up'
    end
    
    def subscribe_to_a_plan(plan, credit_card)
      click_link_after_page_load(plan)
      fill_in "Card Number", with: credit_card
      page.select '10', from: "card_month"
      page.select '2029', from: 'card_year'

      click_button 'Subscribe Me'
    end
    
    def add_new_credit_card(credit_card)
      wait_until_page_has_text('Card Number')
      fill_in "Card Number", with: credit_card    
      page.select '10', from: "card_month"
      page.select '2028', from: 'card_year'
      click_button 'Add Credit Card'
    end
    
    def make_payment(credit_card)
      wait_until_page_has_text('Card Number')
      fill_in "Card Number", with: credit_card
      page.select '10', from: "card_month"
      page.select '2029', from: 'card_year'
      click_button 'Submit Payment'
    end
    
    def checkout_product
      visit products_show_path
      click_link 'Buy Now'
    end
    
    def register_after_guest_checkout(email, password)
      click_link_after_page_load('Create your free account now')
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign Up'
    end
    
    def logout
      click_link 'Logout'
    end
    
    def login(email, password)
      click_link 'Login'
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Log in'
    end
    
    def change_credit_card_expiration_date
      visit credit_cards_edit_path    
      page.select '10', from: "card_month"
      page.select '2028', from: 'card_year'
      click_button 'Change Expiration Date'
    end
    
    def test_email
      "guest_#{Time.now.to_i}#{rand(100)}@example.com"
    end
  end
end