require 'spec_helper'

describe "/knots/show.html.haml" do
  before(:each) do
    assigns[:knot] = @knot = stub_model(Knot,
      :url => "http://url.url",
      :summary => "value for summary",
      :title => "value for title",
      :state => "value for state",
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(/http:\/\/url.url/)
    rendered.should contain(/value\ for\ summary/)
    rendered.should contain(/value\ for\ title/)
    rendered.should contain(/value\ for\ state/)
  end
end
