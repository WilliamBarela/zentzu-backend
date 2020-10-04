class Api::V1::RegistrationController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    person = Person.new(person_params)
    if person.save
      token = encode_token({:person_id => person.id})
      render json: {
        person: {
          email: person.email
        },
        jwt_token: token
      }, status: :accepted
    else
      render json: {errors: index_array(person.errors.full_messages) }, status: :bad_request
    end
  end

  private
  def person_params
    params.require(:person).permit(:email, :password, :first_name, :last_name, :summary)
  end
end
