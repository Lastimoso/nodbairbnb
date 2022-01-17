require "open-uri"

class FlatsController < ApplicationController
  FLATS_URL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json".freeze

  before_action :set_flats, only: [:index, :show]

  def index
  end

  def show
    @flat = @flats.find do |hash|
      hash["id"] == params[:id].to_i
    end
  end

  private

  def set_flats
    raw_text = open(FLATS_URL).read
    @flats = JSON.parse(raw_text)
  end
end
