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
    response.should have_text(/value\ for\ url/)
    response.should have_text(/value\ for\ summary/)
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/1/)
  end
end
