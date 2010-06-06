require 'factory_girl'

Factory.define :knot do |k|
  k.url "http://example.com"
  k.title "Example"
  k.summary "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
end