class OrdersController < ApplicationController
  def index
  end

  def upload
    debugger
    redirect_to :orders unless params[:file]
    text_file = params[:file].read

    # Validates the file uploaded
    unless ::Validators::FileValidator.new(text_file).validate
      @object = { erros: 'Arquivo não é separa por tab ou não possui todas as colunas' }
      redirect_to :orders
    end

    ::Operations::Import.new(text_file).import_to_database


    # text_file = params[:file]

    # # Warn if no file was selected
    # flash[:notice] = 'Você deve escolher um arquivo' if text_file.nil?

    # text_file.read.each_line do |line|
    #   puts line
    #   line = line.split(/\t/)
    #   puts line
    #   exit if line.size == 1
    # end


  end
end
