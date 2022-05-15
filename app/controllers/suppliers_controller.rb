class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    supplier_params = params.require(:supplier).permit(:corporate_name, :brand_name, :city, :registration_number, 
                                     :full_address, :state, :email)
    @supplier=Supplier.new(supplier_params)

    if @supplier.save()
      redirect_to @supplier, notice:'Fornecedor cadastrado com sucesso.'
    else
      flash.now[:notice]='Fornecedor não cadastrado.'
      render 'new'
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    supplier_params = params.require(:supplier).permit(:corporate_name, :brand_name, :city, :registration_number, 
                                     :full_address, :state, :email)
    if @supplier.update(supplier_params)
      redirect_to supplier_path(@supplier.id), notice: 'Fornecedor atualizado com sucesso.'
    else
      flash.now[:notice] = 'Não foi possível atualizar o fornecedor.'
      render 'edit'
    end                                      
  end
end