require 'rails_helper'

RSpec.describe FoodsController, type: :request do
    describe 'GET index' do
      before :each do
        get '/public_recipes'
      end
      it 'the response status is correct, that is it should return code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
end