class Admin::SalesController < ApplicationController

  
  def index
    @sales = Sale.all
  end

  def new
    @sales = Sale.new
  end

  def create
    @sales = Sale.new(sale_params)

    if @sales.save
      redirect_to [:admin, :sales], notice: 'Sale created!'
    else
      render :new
    end
  end

  def edit
    @sales = Sale.find params[:id]
  end

  def update
    @sales = Sale.find params[:id]

    if @sales.update(sale_params)
      redirect_to [:admin, :sales], notice: 'Sale updated!'
    else
      render :new
    end

  end

  private

  def sale_params
    params.require(:sale).permit(
      :name,
      :start_on,
      :ends_on,
      :percent_off
    )
  end
end
