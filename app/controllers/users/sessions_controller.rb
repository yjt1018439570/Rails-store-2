# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  protect_from_forgery with: :null_session, only: :create

  respond_to :html, :json

  def create
    super do |resource|
      if request.format.json?
        render json: { user: resource }, status: :created and return
      end
    end
  end

  def destroy
    signed_out = sign_out(resource_name)
    if signed_out
      respond_to do |format|
        format.json { head :no_content }
        format.html { redirect_to after_sign_out_path_for(resource_name) }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: "Failed to sign out" }, status: :unprocessable_entity }
        format.html { redirect_to after_sign_out_path_for(resource_name), alert: "Failed to sign out" }
      end
    end
  end
end
