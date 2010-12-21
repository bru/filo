class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :trackable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :nickname, :email, :password, :password_confirmation, :remember_me, :language, :public_flag
  
  has_friendly_id :nick_or_email, 
                  :use_slug => true, 
                  :max_length => 40 
  
  has_many :knots, :order => "created_at DESC"
  validates_presence_of :nickname, :if => :is_public?, :allow_blank => true
  validates_length_of   :nickname, :within => 1..40,   :allow_blank => true
  validates_format_of   :nickname, :with => /\A[a-z0-9_\-]+\Z/i, :allow_blank => true
  validates_uniqueness_of :nickname, :if => :is_public?
  
  def nick_or_email
    nickname.blank? ? email : nickname
  end
  
  def normalize_friendly_id(text)
    text.to_url
  end
  
  def is_public?
    self.public_flag
  end
  
  def is_private?
    !is_public?
  end
  
end
