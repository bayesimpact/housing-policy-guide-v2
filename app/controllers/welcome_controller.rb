class WelcomeController < ApplicationController
  def home
    @policies = Policy.limit(12)
  end

  def about
  end
end
