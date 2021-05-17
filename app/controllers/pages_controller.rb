class PagesController < ApplicationController
  

  def index
    if current_user
      render layout: 'main'
    else
      render layout: 'application'
    end

  end



end