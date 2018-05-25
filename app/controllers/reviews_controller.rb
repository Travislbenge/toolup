class ReviewsController < ApplicationController
  def new
    # we need @tool in our `simple_form_for`
    @tool = Tool.find(params[:tool_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @tool = Tool.find(params[:tool_id])
    # we need `tool_id` to asssociate review with corresponding tool
    @review.tool = @tool
    @review.user = current_user
    authorize @review
     if @review.save
      respond_to do |format|
        format.html { redirect_to tool_path(@review.tool) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'tools/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
