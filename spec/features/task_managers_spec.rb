require 'rails_helper'

RSpec.feature 'TaskManagers', type: :feature do
  let!(:user) { create(:user) }

  feature 'Share list' do
    background do
      visit root_path
      click_link 'Login'
      within 'form' do
        fill_in('Email', with: user.email)
        fill_in('Password', with: user.password)
      end
      click_button 'Sign in'
    end

    scenario 'success delivery the email to new user', js: true do
      fill_in('email', with: 'sharemail@mail.com')
      click_button('Send')
      expect(page).to have_text('Email is sent')
    end

    # scenario 'fails delivery the email to owner', js: true do
    #   click_link 'Login'
    #   within 'form' do
    #     fill_in('Email', with: user.email)
    #     fill_in('Password', with: user.password)
    #   end
    #   click_button 'Sign in'
    #   # save_and_open_page
    #   fill_in('email', with: user.email)
    #   click_button('Send')

    #   expect(page).to have_text('This user is already')
    # end
  end
end
