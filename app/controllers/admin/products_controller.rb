class Admin::ProductsController < Admin::AdminController
  before_action :load_product, only: %i(show edit update destroy)
  before_action :product_params, only: :create

  def index
    @products = Product.order_by_name
      .page(params[:page])
      .per Settings.product_per_page
  end

  def new
    @product = Product.new
    @image = @product.images.build
  end

  def create
    @product = Product.new product_params
    insert_data
    redirect_to admin_products_path
  end

  def show; end

  def edit; end

  def update
    if @product.update_attributes product_params
      flash[:success] = t ".success"
      redirect_to admin_products_path
    else
      flash[:danger] = t ".danger"
      render :edit
    end
  end

  def destroy
    if @product.order_details.count == Settings.categories.category_empty
      if @product.destroy
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".danger"
      end
      redirect_to admin_products_path
    else
      flash[:warning] = t ".warning"
      redirect_to admin_products_path
    end
  end

  private

  def load_product
    @product = Product.find_by(id: params[:id]) || not_found
  end

  def product_params
    params.require(:product).permit :name, :price, :descriptions, :category_id
  end

  def insert_data
    ActiveRecord::Base.transaction do
      @product.save
      params[:images]["image_link"].each do |image|
        @image = Image.create product_id: @product.id, image_link: image
        @image.save
      end
    end
    return unless @product.persisted?
  end
end
