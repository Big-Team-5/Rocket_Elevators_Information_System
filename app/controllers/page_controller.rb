class PageController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :residential, :commercial]
  def index
  end

  def residential
  end

  def commercial
  end

  def quote
  end

end
