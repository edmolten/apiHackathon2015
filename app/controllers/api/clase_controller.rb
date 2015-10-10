class Api::ClaseController < ApplicationController
  skip_before_filter :verify_authenticity_token
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

  def get
    if params.permit(:user_id) != {}
        clases = Clase.where({:user_id => params.permit(:user_id)})
        render :status => :ok,
             :json => { :success => true,
                        :data => clases }
    else
      filtro = params.permit(:tema_id,:nivel)
      clases = Clase.where({:tema_id => filtro[:tema_id],:nivel => filtro[:nivel]})
      render :status => :ok,
             :json => { :success => true,
                        :data => clases }
    end

  end

  def clase_params
    params.require(:clase).permit(:title, :isADomicilio, :isDesignadoPorTutor, :price, :user_id,:tema_id,:description,:disponibilidad,:nivel,:activa, :lat, :long,:contacto )
  end

end
