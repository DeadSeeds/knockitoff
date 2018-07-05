module ApplicationHelper
  def current_user_id
    if current_user.present?
      current_user.id
    else
      nil
    end
  end
end
