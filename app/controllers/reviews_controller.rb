class ReviewsController < ApplicationController
  def new
    # we need @tool in our `simple_form_for`
    @tool = Tool.find(params[:tool_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `tool_id` to asssociate review with corresponding tool
    @review.tool = Tool.find(params[:tool_id])
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
