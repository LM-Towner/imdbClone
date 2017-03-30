module ApplicationHelper
  def long_form_date(timestamp)
    timestamp.strftime('%B %e, %Y')
  end
  
def time(timestamp)
  timestamp.strftime("at %I:%M%p")
  end
end
