DATE_IN_STRING = /(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})/

def last_log_entry_date
  File.open("D:/repos/100DaysOfCode/log.md", "r") do |file|
    dates = file.each_line.select {|line| line.match?(DATE_IN_STRING)}
    dates.last.delete_prefix("### ").delete_suffix(" \n")
  end
end

def increment_log_entry(day_and_date)
  day = day_and_date.partition('Day').last.partition(":").first.strip
  date = day_and_date[DATE_IN_STRING]
end


increment_log_entry(last_log_entry_date)