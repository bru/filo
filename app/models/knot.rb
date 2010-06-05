class Knot < ActiveRecord::Base
  include AASM
  belongs_to :user
  
  validates_length_of :summary, :within => 0..160, :allow_blank => true
  validates_length_of :title, :within => 0..128, :allow_blank => true  
  
  aasm_initial_state :unread
  aasm_column :state
  
  aasm_state :unread
  aasm_state :read, :enter => Proc.new {|k| k.last_read_at = Time.new }
  aasm_state :trashed

  aasm_event :read do
    transitions :from => :unread, :to => :read
    transitions :from => :read, :to => :read
  end
  
  aasm_event :unread do
    transitions :from => :unread, :to => :unread
    transitions :from => :read, :to => :unread
    transitions :form => :trashed, :to => :unread
  end
  
  aasm_event :trash do 
    transitions :from => :unread, :to => :trashed
    transitions :from => :read, :to => :trashed
    transitions :from => :trashed, :to => :trashed
  end
  
  def human_title
    title.empty? ? self.url : self.title
  end
  
    
end
