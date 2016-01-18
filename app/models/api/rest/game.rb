class Api::Rest::Game < ActiveRecord::Base
  has_and_belongs_to_many :meetings

  validates_presence_of :name
end
