class LikesController < ApplicationController
  def index
    
    @likes = Like.load_like(current_user.id)
    @like = Like.load_like(current_user.id).pluck(:product_id)
    @products = Product.where(id: @like).page(params[:page]).per(8)
  end

  def create
  	@like = current_user.likes.build(like_params)
  	@product = @like.product
    if @like.save
  	  respond_to :js
  	else
  	  flash[:alert] = "sth wrong"
  	end
  end

  def destroy
  	@like = Like.find(params[:id])
    @product = @like.product
    @like.destroy
    respond_to :js
  end

  private

  def like_params
  	params.permit :product_id
  end
end