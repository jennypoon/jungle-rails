class ReviewsController < ApplicationController

  def create
    @review = Review.new
    @review.product_id = params[:product_id]
    @review.user = current_user
    @review.description = params[:review][:description]
    @review.rating = params[:review][:rating]

    @review.save!

      if @review.save
        redirect_to @review.product
      else
        redirect_to @review.product
      end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.review.find_by(product_id: @product.id, user_id: session[:user_id])
    @review.destroy

    redirect_to @review.product
  end
end
