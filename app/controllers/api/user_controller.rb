class Api::UserController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  def new
    @new = User.new(user_params)
    @new.valoracion = 0
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
    render json: {:success => true , :users => User.all }
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
