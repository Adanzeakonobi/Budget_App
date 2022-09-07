class CategoriesController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!

    def index
    end
  
    def show
    end

    def new; end

    def create
      category_name = category_params['name'].downcase
      category = current_user.categories.new(name: category_name, icon: category_params['icon'])
      if Category.where(name: category_name).exists?
        redirect_to new_category_url, notice: "This category name already exists"
        return
      else
        if category.save
          flash[:success] = 'You successfully added a category to your application'
          redirect_to categories_url
        else
          flash.now[:error] = 'Error: You could not create a new category'
          render :new
        end
      end
    end
  
    private
  
    def category_params
      params.require(:add_category).permit(:name, :icon)
    end
end
