require 'rails_helper'

RSpec.describe 'PublicRecipe', type: :feature do
  describe 'index page' do
    before :each do
      @first_recipe = Recipe.create(name: 'first', preparation_time: '1 hour', cooking_time: '30 minutes',
                                    description: 'Tasty', public: true)
    end

    feature 'Testing post index page' do
      background { visit public_recipes_path }

      scenario 'I can see the user\'s recipe name.' do
        expect(page).to have_content('Go Home')
      end

      scenario 'I can see the Total food items.' do
        expect(page).to have_content('Log In')
      end
    end
  end
end
