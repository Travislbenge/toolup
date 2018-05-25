class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :homepage

  def index

    @render_footer = true
    @tools = policy_scope(Tool)
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @tools = Tool.where(sql_query, query: "%#{params[:query]}%")
    else
      @tools = Tool.all
    end
    authorize @tools
    @locations = Tool.where.not(latitude: nil, longitude: nil)

    @markers = @tools.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude
          # infoWindow: { content: render_to_string(partial: "/tools/map_box", locals: { flat: flat }) }
        }
     end
  end

  def show
    @render_footer = true
    @tool = Tool.find(params[:id])
    @review = Review.new
    authorize @tool
    @markers = [@tool].map do |location|
        {
          lat: location.latitude,
          lng: location.longitude
          # infoWindow: { content: render_to_string(partial: "/tools/map_box", locals: { flat: flat }) }
        }
     end
  end

  def new
    @render_footer
    @tool = Tool.new
    authorize @tool
    @user = current_user
  end

  def create
    @render_footer
    @tool = Tool.new(tool_params)
    @tool.owner = current_user
    authorize @tool
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    authorize @tool
    @tool.destroy
    redirect_to tools_path
  end

  def edit
    @render_footer
    @tool = Tool.find(params[:id])
    authorize @tool
    @user = current_user
  end

  def update
    @render_footer = true
    @tool = Tool.find(params[:id])
    authorize @tool
    @tool.update(tool_params)
    redirect_to tool_path(@tool)
  end

  def mine
    @tools = current_user.my_tools
    authorize @tools
    @render_footer = true
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :price, :category, :photo, :address, :term)
  end
end
