# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @google_maps_url = 'https://goo.gl/maps/Pod7HjsjYxdtGvW66'
    @cool_earth_url = 'https://www.coolearth.org/'
  end
end
