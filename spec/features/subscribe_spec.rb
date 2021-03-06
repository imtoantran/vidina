require 'rails_helper'
require 'spec_helper'

feature 'Subscription' do
    
  scenario 'Customer subscribes to Gold plan', js: true do
    sign_up(test_email, '12345678') 
    visit pricing_path

    subscribe_to_a_plan('Gold', '4242424242424242')
    sleep 3
    expect(page).to have_content('You have been subscribed to Gold.')
  end
  
  # TODO : This test is failing for some reason when sleep is not used.
  scenario 'Customer credit card expired', js: true do
    sign_up(test_email, '12345678')
    visit pricing_path

    subscribe_to_a_plan('Gold', '4000000000000069')
    sleep 3
    expect(page).to have_content('Your card has expired.')
  end
  
  scenario 'Customer credit card number incorrect', js: true do
    sign_up(test_email, '12345678') 
    visit pricing_path
        
    subscribe_to_a_plan('Gold', '4242424242424241')
    
    sleep 3
    expect(page).to have_content('Your card number is incorrect.')    
  end
  
  scenario 'Customer credit card declined', js: true do
    sign_up(test_email, '12345678') 
    visit pricing_path
        
    subscribe_to_a_plan('Gold', '4000000000000002')
    
    sleep 3
    
    expect(page).to have_content('Your card was declined.')
  end
  
  scenario 'Customer credit card processing error', js: true do
    sign_up(test_email, '12345678') 
    visit pricing_path
        
    subscribe_to_a_plan('Gold', '4000000000000119')
    
    sleep 3
    expect(page).to have_content('An error occurred while processing your card. Try again in a little bit.')
  end
  
end