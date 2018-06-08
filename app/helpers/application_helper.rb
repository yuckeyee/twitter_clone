module ApplicationHelper
  def avatar_image(user)
    if user.avatar.attached?
      image_tag user.avatar, class: 'rounded-circle-sm'
    else
      image_tag '/no_image.png', class: 'rounded-circle-sm'
    end
  end
end
