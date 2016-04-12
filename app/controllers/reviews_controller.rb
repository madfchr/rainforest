class ReviewsController < ApplicationController
  before_action :load_product
  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to products_path, notice: 'Review created successfully'
    else
      render 'products/show'
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  def load_product
    @products = Product.find(params [:product_id])
  end
end
