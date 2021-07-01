# Main Application controller

require 'time'
require_relative "utilities"
require_relative "../models/Event"
require_relative "../models/Speaker"
require_relative "../models/Talk"

# Application main method, loops until broken by an escape action.
def app
    # Greet User
    greeting
    
    while true
        # Serve menu
        menu_prompt

        # Handle Input
        handle_menu
    end
end

def handle_menu 
    response = gets.chomp

    if valid_command response
        # Handle input
        case com_split(response)[0].upcase
        when "CREATE"
            if valid_object response
                handle_create response
            end
        when "PRINT"
            if valid_object response
                handle_print response
            end
        when "X"
            system "clear"
            exit
        when "H"
            system "clear"
            help
        else
            handle_invalid_input "Unknown command."
        end
    end
end

def handle_create(response)

    # Ensures there is at least one value following the object.
    valid_arguments response

    case com_split(response)[1].upcase

    when "EVENT"
        if correct_number_of_args(response, 3)
            event = Event.new(remove_apos com_split(response)[2]);
        end
    when "SPEAKER"
        if correct_number_of_args(response, 3)
            speaker = Speaker.new(remove_apos com_split(response)[2]);
        end
    when "TALK"
        if correct_number_of_args(response, 7)
            talk = Talk.new(*com_split(response)[2,6]);
        end
    else
        handle_invalid_input "Unkown object."
    end

end

def handle_print(response)

    # Ensures there is at least one value following the object.
    valid_arguments response

    case com_split(response)[1].upcase

    when "TALKS"
        if correct_number_of_args(response, 3)
            p com_split(response)[2]
            Event.print_event_name com_split(response)[2]
        end
    else
        handle_invalid_input "Unkown object."
    end

end