require 'spec_helper'

describe Knot do
  before(:each) do
    @valid_attributes = {
      :url => "http://url.com",
      :summary => "value for summary",
      :title => "value for title",
      :state => "value for state",
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Knot.create!(@valid_attributes)
  end
end
