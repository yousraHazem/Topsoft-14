class ContentProvidersController < ApplicationController
  include SessionsHelper

  before_filter :set_content_provider

  def set_content_provider
    if signed_in? && ContentProvider.exists?(username:
      current_user.username)
      @content_provider = current_user
    else
      redirect_to session_path :new
    end
  end

  # Renders the content provider's homepage
  # Authors: Nouran T. Attia
  def show
  end
end
