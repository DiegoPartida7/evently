class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    if current_user
      render layout: 'main'
    else
      render layout: 'application'
    end
  end


end