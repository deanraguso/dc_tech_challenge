COMMANDS = ["CREATE", "PRINT"]

def greeting
    puts "Welcome to Mad Events planner.\n\n"
end

def menu_prompt
    print "Enter your command: "
end

def invalid_input
    clear
    puts "Input was invalid!"
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

def handle_invalid_input
    invalid_input
    menu_prompt
    handle_menu
end

def valid_command(response)
    # Checks input has at least one command
    unless (response.split(" ").length > 0) && (COMMANDS.include? response.split(" ")[0].upcase)
        handle_invalid_input
    end
end

def handle_menu 
    response = gets.chomp

    # Validate input is non-empty, and has a supported command.
    valid_command response

    # Handle input
    case response.split(" ")[0].upcase
    when "CREATE"
        puts "You are trying to create something"
    when "PRINT"
        puts "You are trying to print something"
    else
        handle_invalid_input
    end

end