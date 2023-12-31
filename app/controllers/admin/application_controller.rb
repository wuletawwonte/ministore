# frozen_string_literal: true

# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      # TODO: Add authentication logic here.
      # redirect_to '/', alert: 'Not authorized.' unless current_user && current_user.admin?
      redirect_to '/', alert: 'Not authorized.' unless current_user
    end

    def records_per_page
      params[:per_page] || 10
    end
  end
end
