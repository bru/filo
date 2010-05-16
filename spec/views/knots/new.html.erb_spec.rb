require 'spec_helper'

describe "/knots/new.html.erb" do

  before(:each) do
    assigns[:knot] = stub_model(Knot,
      :new_record? => true,
      :url => "value for url",
      :summary => "value for summary",
      :title => "value for title",
      :state => "value for state",
      :user_id => 1
    )
  end

  it "renders new knot form" do
    render

    response.should have_tag("form[action=?][method=post]", knots_path) do
      with_tag("input#knot_url[name=?]", "knot[url]")
      with_tag("textarea#knot_summary[name=?]", "knot[summary]")
      with_tag("input#knot_title[name=?]", "knot[title]")
    end
  end
end
