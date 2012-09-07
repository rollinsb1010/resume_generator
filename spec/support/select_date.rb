module SelectDate
  def get_base_dom_id_from_label_tag(field)
    find(:xpath, ".//label[contains(., '#{field}')]")['for'].gsub(/(_[1-5]i)$/, '')
  end

  def select_month(date, options)
    date        = Date.parse(date)
    base_dom_id = get_base_dom_id_from_label_tag(options[:from])

    find(:xpath, ".//select[@id='#{base_dom_id}_1i']").select(date.year.to_s)
    find(:xpath, ".//select[@id='#{base_dom_id}_2i']").select(I18n.l date, :format => '%B')

  end

  def select_date(date, options)
    date = Date.parse(date)
    base_dom_id = get_base_dom_id_from_label_tag(options[:from])

    find(:xpath, ".//select[@id='#{base_dom_id}_1i']").select(date.year.to_s)
    find(:xpath, ".//select[@id='#{base_dom_id}_2i']").select(I18n.l date, :format => '%B')
    find(:xpath, ".//select[@id='#{base_dom_id}_3i']").select(date.day.to_s)
  end
end

