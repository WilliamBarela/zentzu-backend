class Api::V1::PeopleController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    person = Person.find_by_id(current_user)
    render json: {
      :person_id => person.id,
      :email => person.email
    }
  end

  def create
    person = Person.create(person_params)
    if person.valid?
      render json: {
                    :errors => false,
                    :jwt_token => encode_token(
                      {
                        :person_id => person.id,
                        :email => person.email
                      }
                    )}, status: :created
    else
      render json: {:errors => person.errors.full_messages}, status: :not_acceptable
    end
  end

  private
  def person_params
    params.require(:person).permit(:email, :password, :first_name, :last_name, :summary)
  end
end
