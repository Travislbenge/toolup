class ReviewsController < ApplicationController
  def new
    # we need @tool in our `simple_form_for`
    @tool = Tool.find(params[:tool_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    # we need `tool_id` to asssociate review with corresponding tool
    @review.tool = Tool.find(params[:tool_id])
    @review.user = current_user
    authorize @review
    @review.save
    redirect_to tool_path(@review.tool)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
