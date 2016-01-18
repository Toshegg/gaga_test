# stub for user, necessary to tie meetings and filters to someone

class Api::Rest::User < ActiveRecord::Base
  has_many :filters, dependent: :destroy
  has_and_belongs_to_many :meetings

  validates_presence_of :nickname
  validates_uniqueness_of :nickname
end
