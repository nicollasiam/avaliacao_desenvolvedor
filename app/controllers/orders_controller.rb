class OrdersController < ApplicationController
  def index
  end

  def upload
    unless params[:file]
      redirect_to :root
      flash[:notice] = 'Você deve escolher um arquivo'
      return
    end
    text_file = params[:file].read

    # Validates the file uploaded
    unless ::Validators::FileValidator.new(text_file).validate
      flash[:notice] = 'Arquivo não é separa por tab ou não possui todas as colunas'
      redirect_to :root
    end

    @imported_data = ::Operations::Import.new(text_file).import_to_database
    render 'orders/index'
  end
end
