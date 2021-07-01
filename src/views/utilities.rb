# Utilities View - Common methods that display to output, and don't belong to a model.

require_relative "../controllers/utilities"

# Greets user.
def greeting
    puts Rainbow("Welcome to Mad Events planner.\n\n").yellow
end

# Shows user help options.
def menu_prompt
    print "[x - exit | h - help]\nEnter your command: "
end

# Gives user basic usage instructions.
def help
    puts "For multi-word arguments, use 'single quotes' only."
    puts "To create an event: \t\t\t\tCREATE EVENT event_name."
    puts "To add a speaker to the most recent event: \tCREATE SPEAKER speaker_name."
    puts "To add a speaker to a different event: \t\tCREATE SPEAKER event_name speaker_name."
    puts "To add a talk to an event: \t\t\tCREATE TALK event_name talk_name talk_start_time talk_end_time speaker_name.\n\n"
end

# System clear shortcut.
def clear
    system "clear"
end

# Prints invalid input message.
def handle_invalid_input(comment = "Input was not recognized.")
    clear 

    puts Rainbow("Input was invalid: #{comment}\n\n").red
end

# Prints validation fail message.
def handle_validation_fail(comment = "Arguments had conflicts")
    clear

    puts Rainbow("Validation Fail: #{comment}\n\n").red
end

# Prints success message.
def handle_success(message="Hooray!")
    clear

    puts Rainbow("Action Success: #{message}\n\n").green
end