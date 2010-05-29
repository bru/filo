class User < ActiveRecord::Base
  include Clearance::User
  
  has_friendly_id :nick_or_email, 
                  :use_slug => true, 
                  :max_length => 40 
  
  has_many :knots
  validates_length_of :nickname, :within => 3..40, :allow_blank => true
  validates_uniqueness_of :nickname, :allow_blank => true
  
  def nick_or_email
    nickname.blank? ? email : nickname
  end
  
  def normalize_friendly_id(text)
    text.to_url
  end
  
end
