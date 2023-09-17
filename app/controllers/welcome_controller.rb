# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index

    if not request.url.include?(I18n.locale.to_s) 
      redirect_to "/choose_language"
    end

    @google_maps_url = 'https://goo.gl/maps/Pod7HjsjYxdtGvW66'
    @cool_earth_url = 'https://www.coolearth.org/'
  end

  def choose_language
  end
end
