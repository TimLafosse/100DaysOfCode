require 'date'

DATE_IN_STRING = /(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})/

def extract_last_log_entry_date
  File.open("D:/repos/100DaysOfCode/log.md", "r") do |file|
    dates = file.each_line.select {|line| line.match?(DATE_IN_STRING)}
    dates.last.delete_prefix("### ").delete_suffix(" \n")
  end
end

def update_log_entry_values(day_and_date)
  incremented_day = day_and_date.partition('Day').last.partition(":").first.strip.to_i + 1
  "### Day #{incremented_day}: #{Date.today} \n"
end

def create_log_entry
  #TODO: need way of checking if yesterday was value returned from extract_last_log_entry_date (could use a ternary to and on leg where it was not yesterday, increment day by one )
  new_date = update_log_entry_values(extract_last_log_entry_date)
  set_new_progress
  set_new_thoughts
  update_current_todo
  update_todos

end




