require 'spec_helper'

describe "/knots/new.html.haml" do

  before(:each) do
    assign(:knot, Factory.build(:knot))
  end

  it "renders new knot form" do
    render

    rendered.should have_selector("form[action='#{knots_path}'][method=post]") do |scope|
      scope.should have_selector("input#knot_url[name='knot[url]']")
      scope.should have_selector("textarea#knot_summary[name='knot[summary]']")
      scope.should have_selector("input#knot_title[name='knot[title]']")
    end
  end
end
