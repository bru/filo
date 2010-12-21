require 'spec_helper'

describe "/knots/edit.html.haml" do

  before(:each) do
    assigns[:knot] = @knot = stub_model(Knot,
      :new_record? => false,
      :url => "value for url",
      :summary => "value for summary",
      :title => "value for title",
      :state => "value for state",
      :user_id => 1
    )
  end

  it "renders the edit knot form" do
    render

    rendered.should have_tag("form[action=#{knot_path(@knot)}][method=post]") do
      with_tag('input#knot_url[name=?]', "knot[url]")
      with_tag('textarea#knot_summary[name=?]', "knot[summary]")
      with_tag('input#knot_title[name=?]', "knot[title]")
    end
  end
end
