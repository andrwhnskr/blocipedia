module WikisHelper
  def can_create_private_wikis?
    current_user.role == 'admin' || current_user.role == 'premium'
  end
end
