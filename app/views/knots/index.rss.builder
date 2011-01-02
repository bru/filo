xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Filo :: #{current_user.nick_or_email}"
    xml.description "Unread Knots"
    xml.link knots_url

    for knot in @knots.unread
      xml.item do
        xml.title knot.title
        xml.description knot.summary
        xml.pubDate knot.created_at.to_s(:rfc822)
        xml.link read_knot_url(knot)
      end
    end
  end
end