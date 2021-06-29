COMMANDS = ["CREATE", "PRINT"]
OBJECTS = ["EVENT", "SPEAKER", "TALK", "TALKS"]

def greeting
    puts "Welcome to Mad Events planner.\n\n"
end

def menu_prompt
    print "Enter your command: "
end

def help
    puts "To create an event: CREATE EVENT event_name"
    puts "To add a speaker to the most recent event: CREATE SPEAKER speaker_name"
    puts "To add a speaker to a different event: CREATE SPEAKER event_name speaker_name"
    puts "To add a talk to an event: CREATE TALK event_name talk_name talk_start_time talk_end_time speaker_name"
end

def clear
    system "clear"
end

def invalid_input(comment)
    clear
    puts "Input was invalid: #{comment}\n\n"
end

def handle_invalid_input(comment = "Input was not recognized.")
    invalid_input comment
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

def handle_create(response)
    puts "You are trying to create something"
end

def handle_print(response)
    puts "You are trying to print something"
end

def handle_menu 
    response = gets.chomp

    valid_command response
    valid_object response

    # Handle input
    case response.split(" ")[0].upcase
    when "CREATE"
        handle_create response
    when "PRINT"
        handle_print response
    else
        handle_invalid_input
    end

end