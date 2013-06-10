class Assignment < ActiveRecord::Base
  attr_accessible :name

  has_many :enrollments
  has_many :users, :through => :enrollments


end


