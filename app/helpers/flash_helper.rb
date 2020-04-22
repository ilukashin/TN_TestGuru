module FlashHelper
  def flash_alert_message
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert] 
  end
end
