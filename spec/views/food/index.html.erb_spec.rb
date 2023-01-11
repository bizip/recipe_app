require 'rails_helper'

RSpec.describe 'Rendering foods page', type: :feature do
  describe 'Testing signup page' do
    before :each do
      @food_list = Food.create(name: 'Potato', measurement_unit: 'kg', price: 30)
    end

    feature 'Testing food index page' do
      background { visit foods_path }

      scenario 'It should display measurement unit' do
        expect(page).to have_content('kg')
      end
      scenario 'It should display Food name' do
        expect(page).to have_content('Potato')
      end

      scenario 'It should display food price' do
        expect(page).to have_content(30)
      end
    end
  end
end
