module ApplicationHelper
  def format_datetime(date, format_type)
    format = ""
    case format_type
    when :datetime then
      format = "%Y年%-m月%-d日 %-H:%M:%S"
    end
    date.strftime(format)
  end
end
