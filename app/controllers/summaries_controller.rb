class SummariesController < ApplicationController
  def new

    @post = Post.find(params[:post_id])
    @summary = Summary.new
    authorize @post

  end

  def show
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @summary 
  end

  def edit
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:title, :body))
    authorize @post 
    if @summary.save
      flash[:notice] = "Summary is saved"
      redirect_to @summary
    else 
      flash.now[:error] = "There was an error saving your topic. Please try again"
      render :new
    end
  end

  def update
  end

end
