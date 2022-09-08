class RecordsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @category = current_category
  end

  def new
    @category = current_category
  end

  def create
    record_name = record_params['name']
    record_amount = record_params['amount']
    category_ids = record_params['category_ids'].slice(1..-1)
    category = current_category
    @record = current_user.records.new(name: record_name, amount: record_amount)
    if @record.save
      category_ids.each do |id|
        @record.categories_records.create!(category_id: id.to_i)
      end
      flash[:success] = 'You completed this transaction successfully'
      redirect_to category_records_path(category)
    else
      flash.now[:error] = 'New transaction could not be created.'
      render :new
    end
  end

  def current_category
    @category = current_user.categories.includes(:records).find(params[:category_id])
  end

  private

  def record_params
    params.require(:add_record).permit(:name, :amount, category_ids: [])
  end
end
