class StaticPagesController < ApplicationController
  def home
    @properties = Property.newest
  end

  def blog
  end

  def advertising
  end
end
