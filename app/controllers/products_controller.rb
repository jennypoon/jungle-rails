class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.where product_id: params[:id]
    @user_reviewed = Review.find_by user_id: session[:user_id], product_id: params[:id]
    @current_user_id = session[:user_id]
  end

end

