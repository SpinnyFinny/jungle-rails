class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = 1
    
    if @review.save
      redirect_to :back          
    else
      redirect_to :back       
    end
  end

  def destroy

  end
end

private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id,
      :user_id
    )
  end