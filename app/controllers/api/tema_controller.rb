class Api::TemaController < ApplicationController
  respond_to :json

  def get
    render json: {:success => true , :temas => Tema.all }
  end
end
