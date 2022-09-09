require 'rails_helper'

RSpec.describe Category, type: :request do
  let(:user) do
    User.create!(name: 'Nneka', email: 'ada@ada.com', password: 'password')
  end

  before(:each) do
    sign_in(user)
  end

  after(:each) do
    sign_out(user)
  end

  describe 'GET /categories' do
    it 'tests the URL path for categories#index' do
      get categories_url
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('Add New Category')
    end
  end

  describe 'categories/new' do
    it 'tests the URL path for categories#new' do
      get new_category_url
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
      expect(response.body).to include('Register Your Category')
    end
  end
end
