class Api::Rest::Filter < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :value, :user
end
