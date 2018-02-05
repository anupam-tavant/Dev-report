module ApplicationHelper
  def sidebar_active?(controller)
    ['projects', 'users'].include?(controller.controller_name)
  end
end
