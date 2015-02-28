class SummariesController < ApplicationController
  def new

    @post = Post.find(params[:post_id])
    @summary = Summary.new
    authorize @post

  end

  def show
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @post 
  end

  def edit
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @post
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:title, :body))
    authorize @post 
    if @summary.save
      flash[:notice] = "Summary is saved"
      redirect_to [@post, @summary]
    else 
      flash.now[:error] = "There was an error saving your summary. Please try again"
      render :new
    end
  end

  def update
     @post = Post.find(params[:post_id])
     @summary = Summary.find(params[:id])
    authorize @post
    if @summary.update_attributes(params.require(:summary).permit(:title, :body))
      flash[:notice] = "Summary was saved"
      redirect_to [@post, @summary]
    else
      flash.now[:error] = "There was an error saving your summary. Please try again."
      render :edit
    end
  end

end
