class HomeController < ApplicationController
  def index
    @tweets = Tweet.find(:all, :order => "created_at desc")
  end

  def post
    unless signed_in?
      flash[:error] = 'sorry. you must logged in.'
      redirect_to :action => :index
    end
    t = Tweet.new(:message => params[:tweet][:message])
    t.user_id = current_user.id
    if t.save
      flash[:notice] = 'posted'
      redirect_to :action => :index
    else
      flash[:error] = 'sorry. cannot posted.'
      redirect_to :action => :index
    end
  end

end
