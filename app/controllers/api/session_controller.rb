class Api::SessionController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  def create
    user = User.find_by(email: user_params_login[:email])
    if user && user.authenticate(user_params_login[:password])
      user.remember
      render json: {:success => true , :session => {:user_id => user.id, :remember_token => user.remember_token} }
    else
      render json: {:success => false, :data => { }}
    end
  end

  def test
    ##omito el login---activo remember---envio por json
    user= User.first
    user.remember
    render json: {:success => true, :data => {:remember_token => user.remember_token, :remember_digest => user.remember_digest, :password => user.password}}
  end

  def test2 #USELESS
    ##saco el token desde test----falta una forma de ligar con un usuario--- ¿¿pasar el id en create??
    user = User.first
    if user.authenticated?(:remember , "JEYFVKHLfcecHSTUGfBfdxZOkMJ4NL6SyVe3uEOEu16PS88DE6HYh2wZ/8rIhAuWMa0X4xVafQn2vMg++ANzbM1Hth/NXCfXicgxL1emwY3Isphq+goHCFdKMB+PW+nG1AICGQ==" )
      render json: {:success => true, :user => user.id}
    else
      render json: {:success => false, :data => { }}
    end

  end

  def destroy
    user = User.find_by(remember_token: user_params_logout[:remember_token])
    if user
      user.forget
      render json: {:success => true , :data => {}}
    else
      render json: {:success => false, :data => { }}
    end
  end


  ##creo que esto deberia ir en el helper
  def user_params_logout
    params.require(:logout).permit(:remember_token)
  end


  def user_params_login
    params.require(:login).permit(:email, :password)
  end
end
