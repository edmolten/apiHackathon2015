class Api::ClaseController < ApplicationController
  respond_to :json

  def new
    @new = Clase.new(clase_params)
    if @new.save
      render :status => :ok,
             :json => { :success => true,
                        :data => @new }
    else
      render :status => :unprocessable_entity, #tambien cuando se repite el usuario, se ve feo
             :json => { :success => false,
                        :info => @new.errors.full_messages,
                        :data => {} }
    end
  end

  def clase_params
    params.require(:clase).permit(:title, :isADomicilio, :isDesignadoPorTutor, :price, :user_id,:tema_id,:description,:disponibilidad,:nivel,:activa, :lat, :long,:contacto )
  end

end
