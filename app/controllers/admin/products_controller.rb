class Admin::ProductsController < Admin::AdminController
  before_action :load_product, only: %i(show edit update destroy)

  def index
    @products = Product.order_by_name
      .page(params[:page])
      .per Settings.product_per_page
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".success"
      redirect_to admin_products_path
    else
      flash[:error] = t ".error"
      render :new
    end
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
    if @product.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".danger"
    end
    redirect_to admin_products_path
  end

  private

  def load_product
    @product = Product.find_by id: params[:id] || not_found
  end

  def product_params
    params.require(:product).permit :name, :price, :descriptions, :category_id
  end
end
