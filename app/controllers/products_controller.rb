class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.find_by(product_id: @product.id)
    @user = User.find(@review.user_id)

  end

end
