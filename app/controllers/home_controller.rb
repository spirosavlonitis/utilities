class HomeController < ApplicationController
  def index
    @utilities = Utility.all
  end
end
