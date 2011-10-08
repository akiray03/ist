class Tweet < ActiveRecord::Base
  # relation
  belongs_to :user
end
