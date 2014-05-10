class HomeController < ApplicationController
  # GET /homes
  # GET /homes.json
  def index
    @homes = Home.all
  end
end
