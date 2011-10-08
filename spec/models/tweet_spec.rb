require 'spec_helper'

describe Tweet do
  before do
    @user_attr = {:email => 'user@example.com', :password => 'password', :password_confirmation => 'password'}
    @user = User.create!(@user_attr)
    @tweet = Tweet.create(:message => 'test', :user_id => @user.id)
  end
  it "a message belongs_to user" do
    @tweet.user.email.should == 'user@example.com'
  end
end
