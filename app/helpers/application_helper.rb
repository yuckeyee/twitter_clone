module ApplicationHelper
  def avatar_image(user, image_class)
    if user.avatar.attached?
      image_tag user.avatar, class: image_class
    else
      image_tag '/no_image.png', class: image_class
    end
  end
end
