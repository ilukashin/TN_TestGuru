module FlashHelper
  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type] 
  end

  def bootsrap_type(type)
    case type
    when "notice" then 'info'
    when "alert" then 'warning'
    when "error" then 'danger'
    end
  end
end
