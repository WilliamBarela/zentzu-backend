class ApplicationController < ActionController::API
  before_action :authorized
  attr_reader :jwt_key

  #FIXME: this is a fake development encryption key...set main key in production
  def jwt_key
    'ec6a8b69ae22049f900af9bd9f14ffb4dc6937f69575ab49b4df2d28364055b8'
  end

  def encode_token(payload)
    JWT.encode(payload, jwt_key)
  end

  def token_received
    auth = request.headers['Authorization']
    auth.split(' ')[1] unless auth.nil?
  end

  def decode_token
    if token_received
      begin
        JWT.decode(token_received, jwt_key, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decode_token
      person_id = decode_token[0]['person_id']
      @person = Person.find_by(id: person_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {:message => 'Please log in'}, status: :unauthorized unless logged_in?
  end

  def index_array(errors_array)
    [].tap do |a|
      errors_array.each_with_index do |message, index|
        a << {:message => message, :index => index}
      end
    end
  end
end
