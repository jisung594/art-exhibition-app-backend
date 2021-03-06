class ApplicationController < ActionController::API
  before_action :authorized, only: [:profile]
  # skip_before_action :authorized, only: [:create]

  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]

      begin
        JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')

      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      email = decoded_token[0]['email']
      @user = User.find_by(email: email)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {message: 'Please log in'},
      status: :unauthorized unless logged_in?
  end

end
