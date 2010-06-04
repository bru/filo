class User < ActiveRecord::Base
  include Clearance::User
  
  has_friendly_id :nick_or_email, 
                  :use_slug => true, 
                  :max_length => 40 
  
  has_many :knots, :order => "created_at DESC"
  validates_length_of :nickname, :within => 3..40, :allow_blank => true
  validates_uniqueness_of :nickname, :if => :is_public?
  validates_presence_of :nickname, :if => :is_public?
  
  def nick_or_email
    nickname.blank? ? email : nickname
  end
  
  def normalize_friendly_id(text)
    text.to_url
  end
  
  def is_public?
    self.public_flag
  end
  
end
