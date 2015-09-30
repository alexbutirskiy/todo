module TasksHelper
  def date_time_convert(datetime)
    return nil if datetime.nil?
    return datetime.to_date.to_s if datetime.hour == 0 && datetime.min == 0
    datetime.to_s
  end

  def attachment_class(comment)
    case comment.attachment_content_type
    when "text/plain"
      "text_plain"
    when "application/pdf"
      "application_pdf"
    when "application/pdf"
      "application_pdf"
    when "application/zip"
      "application_zip"
    when "application/msword",
         "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      "application_msword"
    when "application/vnd.ms-excel"
      "application_vnd_ms_excel"
    else "unknown_type"
    end
  end
end
