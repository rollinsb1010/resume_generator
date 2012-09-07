class ExperienceDecorator < SimpleDelegator

  def location
    "#{company} - #{place}"
  end

  def timespan
    formatted_from_date =  I18n.localize(from_date, :format => "%B %Y" )
    return formatted_from_date if from_date == until_date
    formatted_until_date = until_date.nil? ? I18n.t('today') : I18n.localize(until_date, :format => "%B %Y" )
    "#{formatted_from_date} - #{formatted_until_date}"
  end
end