class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true
  before_save do
  	user = User.find(self.user_id)
  	current_kp = (user.karmapoints||0) + self.value
  	user.update_attribute(:karmapoints, current_kp)
  end
end
