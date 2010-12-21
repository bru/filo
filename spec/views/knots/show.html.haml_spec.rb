require 'spec_helper'

describe "/knots/show.html.haml" do
  before(:each) do
    assigns[:knot] = @knot = stub_model(Knot,
      :url => "value for url",
      :summary => "value for summary",
      :title => "value for title",
      :state => "value for state",
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_text(/value\ for\ url/)
    rendered.should have_text(/value\ for\ summary/)
    rendered.should have_text(/value\ for\ title/)
    rendered.should have_text(/value\ for\ state/)
    rendered.should have_text(/1/)
  end
end
