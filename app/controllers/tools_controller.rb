class ToolsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    @tools = policy_scope(Tool)
    authorize @tools
  end

  def index
    @tools = policy_scope(Tool)
    @tools = Tool.all
    authorize @tools
  end

  def show
    @tool = Tool.find(params[:id])
    authorize @tool
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def create
    @tool = Tool.create(tool_params)
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
    @tool = Tool.find(params[:id])
    authorize @tool
  end

  def update
    @tool = Tool.find(params[:id])
    authorize @tool
    @task.update(tool_params)
    redirect_to tool_path(@tool)
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :price, :category, :user_id)
  end
end
