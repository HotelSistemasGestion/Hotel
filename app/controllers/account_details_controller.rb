class AccountDetailsController < ApplicationController
  before_action :set_account_detail, only: [:show, :edit, :update, :destroy]

  # GET /account_details
  # GET /account_details.json
  def index
    @account_details = AccountDetail.all
  end

  # GET /account_details/1
  # GET /account_details/1.json
  def show
  end

  # GET /account_details/new
  def new
    @account_detail = AccountDetail.new
  end

  # GET /account_details/1/edit
  def edit
  end

  # POST /account_details
  # POST /account_details.json
  def create
    @account_detail = AccountDetail.new(account_detail_params)

    respond_to do |format|
      if @account_detail.save
        format.html { redirect_to @account_detail, notice: 'Account detail was successfully created.' }
        format.json { render :show, status: :created, location: @account_detail }
      else
        format.html { render :new }
        format.json { render json: @account_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_details/1
  # PATCH/PUT /account_details/1.json
  def update
    respond_to do |format|
      if @account_detail.update(account_detail_params)
        format.html { redirect_to @account_detail, notice: 'Account detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_detail }
      else
        format.html { render :edit }
        format.json { render json: @account_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_details/1
  # DELETE /account_details/1.json
  def destroy
    @account_detail.destroy
    respond_to do |format|
      format.html { redirect_to account_details_url, notice: 'Account detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_detail
      @account_detail = AccountDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_detail_params
      params.require(:account_detail).permit(:account_id, :service_id, :cantidad, :precio, :subtotal)
    end
end
