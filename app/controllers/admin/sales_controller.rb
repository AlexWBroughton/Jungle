class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    # Initialize a new Sale object for the form
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to admin_sales_path, notice: "Sale created successfully"
    else
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:name, :starts_on, :ends_on, :status, :percent_off)
  end
end
