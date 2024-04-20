# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  protect_from_forgery with: :null_session, only: :create
  respond_to :html, :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      respond_to do |format|
        format.json { render json: { user: resource }, status: :created }
        format.html { super }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: resource.errors }, status: :unprocessable_entity }
        format.html { super }
      end
    end
  end
end
