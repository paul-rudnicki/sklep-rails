class Admin::ProductsController < Admin::BaseController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).per(30)
    # @products = Product.all().page(params[:page]).per(30)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_root_path, notice: "Pomysle dodano produkt"
    else
      render action: :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def udpate
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_root_path, notice: "Pomślnie zaaktulizowano produkt"
    else
      render action: :edit
    end
  end

  def destory
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_root_path, notice: "Pomyślnie zaaktulizowano produkt"
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :long_description,
      :price,
      :photo,
      :category_id
    )
  end

end
