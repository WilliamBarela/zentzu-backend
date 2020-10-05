class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    person = Person.find_by(:email => person_login_params[:email])
    if person && person.authenticate(person_login_params[:password])
      token = encode_token({:person_id => person.id})
      render json: {
        person: {
          email: person.email
        },
        jwt_token: token
      }, status: :accepted
    else
      errors = ["Invalid email or password"]
      render json: { errors: index_array(errors) }, status: :unauthorized
    end
  end

  private
  def person_login_params
    params.require(:person).permit(:email, :password)
  end
end
