COMMANDS = ["CREATE", "PRINT", "X", "H"]
OBJECTS = ["EVENT", "SPEAKER", "TALK", "TALKS"]

def greeting
    puts "Welcome to Mad Events planner.\n\n"
end

def menu_prompt
    print "[x - exit | h - help]\nEnter your command: "
end

def help
    puts "To create an event: \t\t\t\tCREATE EVENT event_name"
    puts "To add a speaker to the most recent event: \tCREATE SPEAKER speaker_name"
    puts "To add a speaker to a different event: \t\tCREATE SPEAKER event_name speaker_name"
    puts "To add a talk to an event: \t\t\tCREATE TALK event_name talk_name talk_start_time talk_end_time speaker_name\n\n"
end

def clear
    system "clear"
end

def invalid_input(comment)
    clear
    puts "Input was invalid: #{comment}\n\n"
end

def handle_invalid_input(comment = "Input was not recognized.")
    clear 

    invalid_input comment
    menu_prompt
    handle_menu
end

def handle_success(message="Hooray!")
    clear

    puts "Action Success: #{message}\n\n"
    menu_prompt
    handle_menu
end

def handle_validation_fail(comment = "Arguments had conflicts")
    clear

    puts "Validation Fail: #{comment}\n\n"
    menu_prompt
    handle_menu
end

# Validate input is non-empty, and has a supported command.
def valid_command(response)
    unless (response.split(" ").length > 0) && (COMMANDS.include? response.split(" ")[0].upcase)
        handle_invalid_input "Valid command not provided. 'CREATE' or 'PRINT'"
    end
end

def valid_object(response)
    unless (response.split(" ").length > 1) && (OBJECTS.include? response.split(" ")[1].upcase)
        handle_invalid_input "Valid object not provided. 'EVENT', 'SPEAKER', 'TALK', or 'TALKS'"
    end
end

def valid_arguments(response)
    unless (response.split(" ").length > 2)
        handle_invalid_input "No arguments provided."
    end
end

def correct_number_of_args(response, n)
    unless (response.split(" ").length == n)
        handle_invalid_input "Wrong number of arguments specified."
    end
end