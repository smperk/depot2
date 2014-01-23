class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescure_from ActiveRecord::RecordNotFound, with: invalid_cart
class CartsController < ApplicationController

  # GET /carts
  #...
  private
  #...
  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to store_url, notice: 'Invalid cart'
  end
end

  def index
    @carts = Cart.all
  end

  # GET /carts/1
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
    redirect_to carts_url, notice: 'Cart was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params[:cart]
    end
