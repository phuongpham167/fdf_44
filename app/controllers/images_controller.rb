class ImagesController < ApplicationController
  before_action :load_image, only: %i(show edit update destroy)

  def new
    @image = Image.new
  end

  private
  def load_image
    @image = Image.find_by id: params[:id] || not_found
  end

  def post_attachment_params
    params.require(:image).permit :product_id, :image_link
  end
end
