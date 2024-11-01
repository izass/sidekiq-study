class EmailController < ApplicationController
  def index
    @emails = Email.all

    render json: @emails
  end

  def create
    @email = Email.new(email_params)

    if @email.save
      render json: @email, status: :created
    else
      render json: {
        message: @email.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def email_params
    params.require(:email).permit(:to, :content)
  end
end
