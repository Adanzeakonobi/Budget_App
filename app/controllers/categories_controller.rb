class CategoriesController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!

    def index
    end
  
    def show
    end
end
