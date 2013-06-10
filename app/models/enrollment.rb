class Enrollment < ActiveRecord::Base
  attr_accessible :assignment_id, :user_id

  belongs_to :user
  belongs_to :assignment

end


