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

def get_new_progress
  puts "What did I do today?"
  "**Today's Progress**: #{gets.chomp}"
end

def get_new_thoughts
  puts "What are my thoughts on today's progress and/or generally?"
  "**Today's Progress**: #{gets.chomp}\n"
end

def update_current_todo
  puts "What is my the main task I am are working on?"
  # TODO: add method that pulls out previous current-todo and asks if this is still the case
  "**Current todo**: #{gets.chomp}"
end

def update_todos
  puts "These are the backlogged todos that I have backlogged"

  #TODO: edit 'extract_last_log_entry_date' to return something more general as not interested in deleting suffix/prefix. Maybe make another method that deals with all MArkdown formatting depending on what kind of header each thing is
  puts "Any to add? (y/n)"
  answer = ''
  until (answer == 'y') || (answer ==  'n')
    gets.chomp.downcase
  end
  added_todo = gets.chomp if (answer == 'y')
  puts "Any to remove? (y/n)"
  if answer == 'y'

  end
  puts "Which one?"
end

# Thoughts
# - the above are all methods that are only used once, is there really a need for them to be individual methods?
# TODO: find a way to generalise the above methods in to a loop when happy they are all returning what they should be
def create_log_entry
  #TODO: need way of checking if yesterday was value returned from extract_last_log_entry_date (could use a ternary to and on leg where it was not yesterday, increment day by one )
  new_date = update_log_entry_values(extract_last_log_entry_date)
  progress = get_new_progress
  thoughts = get_new_thoughts
  todo = update_current_todo
  update_todos

end




