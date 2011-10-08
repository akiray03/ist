require 'spec_helper'

describe User do
  before do
    @user_attr = {:email => 'user@example.com', :password => 'password', :password_confirmation => 'password'}
    @user = User.create!(@user_attr)
  end
  it "a user has_many tweets" do
    @user.tweets << Tweet.new(:message => 'msg')
    @user.tweets << Tweet.new(:message => 'msg2')
    @user.tweets.length.should == 2
    u = User.find_by_email(@user.email)
    u.tweets.length.should == 2
  end
end
