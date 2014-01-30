class HomeController < ApplicationController

  skip_filter :authorised?

  def index
  end
  
end
