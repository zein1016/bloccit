class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
    authorize @topic 
    if @topic.save
      flash[:notice] = "Topic is saved"
      redirect_to @topic
    else 
      flash.now[:error] = "There was an error saving your topic. Please try again"
      render :new
    end
  end

  def update 
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(params.require(:topic).permit(:name, :description, :topic))
      flash[:notcie] = "Topic was saved"
      redirect_to @topic
    else
      flash.now[:error] = "There was an error saving your topic. Please try again."
      render :edit
    end

  end


end
