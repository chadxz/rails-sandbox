class HomeController < ApplicationController
  before_filter :authenticate, :only => :dashboard
  
  def dashboard    
    respond_to do |format|
      format.html { render 'dashboard' }
      format.xml  { }
    end
  end

  def index
    respond_to do |format|
      format.html { render 'index' }
      format.xml  { }
    end    
  end
end
