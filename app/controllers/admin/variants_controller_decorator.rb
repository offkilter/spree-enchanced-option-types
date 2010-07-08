Admin::VariantsController.class_eval do
  def regenerate
    product = Product.find_by_permalink(params[:product_id])
    product.variants.each do |v|
      v.deleted_at = Time.now()
      v.save
    end
    product.do_create_variants(:recreate)
    redirect_to :action => :index, :product_id => params[:product_id]
  end
end