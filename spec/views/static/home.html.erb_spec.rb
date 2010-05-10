require 'spec_helper'

describe "/static/home" do
  before(:each) do
    render 'static/home'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/static/home])
  end
end
