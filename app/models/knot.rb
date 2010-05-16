class Knot < ActiveRecord::Base
  include AASM
  belongs_to :user
  
  aasm_initial_state :unread
  aasm_column :state
  
  aasm_state :unread
  aasm_state :read, :enter => Proc.new {|k| k.last_read_at = Time.new }
  aasm_state :trashed

  aasm_event :read do
    transitions :from => :unread, :to => :read
  end
  
  aasm_event :unread do
    transitions :from => :read, :to => :unread
    transitions :form => :trashed, :to => :unread
  end
  
  aasm_event :trash do 
    transitions :from => :unread, :to => :trashed
    transitions :from => :read, :to => :trashed
  end
  
  def human_title
    title.empty? ? self.url : self.title
  end
  
    
end
