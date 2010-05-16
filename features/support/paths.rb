module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the sign up page/i
      sign_up_path
    when /the sign in page/i
      sign_in_path
    when /the password reset request page/i
      new_password_path

    # Add more page name => path mappings here
    when /the new knot page/i
      new_knot_path
    when /the knots page/i
      knots_path
    when /^the edit knot page for "([^\"]*)"$/
      knot = Knot.find_by_url($1)
      edit_knot_path(knot)
    when /^the read knot page for "([^\"]*)"$/
      knot = Knot.find_by_url($1)
      read_knot_path(knot)
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
