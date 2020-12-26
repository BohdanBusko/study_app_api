class Api::V1::SessionsController < Api::V1::BaseController
  before_action :authenticate_user!, only: :destroy

  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      render json: SessionSerializer.new(user)
    else
      head(:unauthorized)
    end
  end

  def destroy
    current_user.update_token!

    head(:no_content)
  end
end