class Admin::CategoriesController < Admin::AdminController
  before_action :verify_admin
  before_action :load_category, only: %i(show edit update destroy)

  def index
    @categories = Category.select_fields.order_by_time
      .page(params[:page]).per Settings.user.per_page
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".success"
      redirect_to admin_categories_path
    else
      flash[:error] = t ".fail"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = t "success"
      redirect_to admin_category_path
    else
      render :edit
    end
  end

  def destroy
    if @category.products.count == Settings.categories.category_empty
      if @category.destroy
        flash[:success] = t ".success"
        redirect_to admin_categories_path
      else
        flash[:danger] = t ".danger"
        redirect_to admin_category_path
      end
    else
      flash[:warning] = t ".warning"
      redirect_to admin_category_path
    end
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id] || not_found
  end
end
