require 'spec_helper'

describe "/knots/index.html.erb" do
  include KnotsHelper

  before(:each) do
    assigns[:knots] = [
      stub_model(Knot,
        :url => "value for url",
        :summary => "value for summary",
        :title => "value for title",
        :state => "value for state",
        :user_id => 1
      ),
      stub_model(Knot,
        :url => "value for url",
        :summary => "value for summary",
        :title => "value for title",
        :state => "value for state",
        :user_id => 1
      )
    ]
  end

  it "renders a list of knots" do
    render
    response.should have_tag("tr>td", "value for url".to_s, 2)
    response.should have_tag("tr>td", "value for summary".to_s, 2)
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
