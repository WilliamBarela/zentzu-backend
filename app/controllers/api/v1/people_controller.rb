class Api::V1::PeopleController < ApplicationController
  def create
    person = Person.create(person_params)
    if person.valid?
      render json: {:errors => false}, status: :created
    else
      render json: {:errors => person.errors.full_messages}, status: :not_acceptable
    end
  end

  private
  def person_params
    params.require(:person).permit(:email, :password, :first_name, :last_name, :summary)
  end
end
