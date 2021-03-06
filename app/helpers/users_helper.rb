module UsersHelper
  def gravatar_for(user, options = { size: 20, default: 'mm' })
    gravatar_image_tag(user.email.downcase, alt: user.name,
                                            class: 'gravatar',
                                            gravatar: options)
  end
end
