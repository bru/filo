RailsAdmin.authorize_with do
  redirect_to root_path unless current_user.admin?
end

RailsAdmin.config do |config|
  config.model Slug do
    hide_from_navigation
  end
  config.model Knot do
    list do
      field :url
      field :title 
      field :state
      field :created_at
    end
  end
  config.model User do
    list do
      field :cached_slug do
        label "Slug"
      end
      field :admin do
        label "Admin?"
      end
      field :public_flag do
        label "Public?"
      end
      field :nickname
      field :email
      field :language
      field :created_at
    end
  end
end