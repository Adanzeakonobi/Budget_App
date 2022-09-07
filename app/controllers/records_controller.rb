class RecordsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    
    def index
        @category = current_user.categories.includes(:records).find(params[:category_id])
    end
  
    def show
    end

    def new; end

  def create
    record_name = record_params['name']
    record_amount = record_params['amount']
    category_ids = record_params['category_ids'].slice(1..-1)
    first_category = Category.find_by(id: record_params['category_ids'][1].to_i)
    @record = current_user.records.new(name: record_name, amount: record_amount)
    if @record.save
      category_ids.each do |id|
        @record.categories_records.create!(category_id: id.to_i)
      end
      flash[:success] = "You completed this transaction successfully"
      redirect_to category_records_path(first_category.id)
    else
      flash.now[:error] = "New transaction could not be created."
      render :new
    end
  end

  def record_params
    params.require(:add_record).permit(:name, :amount, category_ids:[])
  end
end
