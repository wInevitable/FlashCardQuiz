class PagesController < ApplicationController
  def home
    @high_score = Quiz.high_score
  end
end
