class User < ActiveRecord::Base
  attr_accessible :classroom_admin, :name, :provider, :ui

  has_many :enrollments
  has_many :assignments, :through => :enrollments

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end


end


