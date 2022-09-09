require 'rails_helper'

RSpec.describe Record, type: :request do
   let(:user) { User.create!(name: 'Nneka', email: 'ada@ada.com', password: 'password') }
   let (:category) { user.categories.create(name: 'Games', icon: 'multi-colored.png') }
   let(:record) { user.records.create(name: 'clothes', amount: 20) }
  let(:category_record) { CategoriesRecord.create(category_id: category.id, record_id: expense.id) }

  before(:each) do
    sign_in(user)
  end

  after(:each) do
    sign_out(user)
  end
  # before :each do
  #   user = User.create!(name: 'Nneka', email: 'ada@ada.com', password: 'password')
  #   @category = user.categories.new(name: 'Games')
  #   @category.icon.attach(
  #     io: File.open(Rails.root.join('spec', 'fixtures', 'multi-colored.png')),
  #     filename: 'multi-colored.png',
  #     content_type: 'application/xlsx'
  #   )
  #   @category.save!
  #   login_as user
  # end


  describe 'GET #index page' do
    it 'tests the URL path for records#index' do
      get category_records_path(category)
      # get "/categories/#{category_id}/records"
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Total Payment')
    end
  end

  describe 'GET #new page' do
    it 'tests the URL path for records#new' do
      get new_category_record_url
      # get "/categories/#{category_id}/records/new"
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:new)
      expect(response.body).to include('Create Your Transaction')
    end
  end
end