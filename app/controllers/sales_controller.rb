class SalesController < ApplicationController

  before_action :set_sale, only: [:show, :edit, :update, :destroy, :approve, :disapprove]

  load_and_authorize_resource
  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end
  # GET /sales/1
  # GET /sales/1.json
  def show
    @sales = Sale.all
  end

  def report
    @report = Sale.all
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    #@sale_count = 0
    ####################
  end
  # GET /sales/1/edit
  def edit
  end

  def approve
    @sale.update(approved: true)
    redirect_to sales_url
  end

  def disapprove
    @sale.update(approved: false)
    redirect_to sales_url
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    #####################@sale_count++
    @sale.user_id = current_user.id 
    @sale.total = @sale.total_all 
    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def sale_params
    params.require(:sale).permit(:name, items_attributes: [:id,:product_id, :price,:quantity,:total,:_destroy])
  end
end
