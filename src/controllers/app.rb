require 'time'
require_relative "utilities"
require_relative "../models/Event"
require_relative "../models/Speaker"
require_relative "../models/Talk"

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

    valid_command response
    
    # Handle input
    case response.split(" ")[0].upcase
    when "CREATE"
        valid_object response
        handle_create response
    when "PRINT"
        valid_object response
        handle_print response
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

def handle_create(response)

    # Ensures there is at least one value following the object.
    valid_arguments response

    case response.split(" ")[1].upcase

    when "EVENT"
        correct_number_of_args(response, 3)
        event = Event.new(response.split(" ")[2]);

    when "SPEAKER"
        correct_number_of_args(response, 3)
        speaker = Speaker.new(response.split(" ")[2]);

    when "TALK"
        correct_number_of_args(response, 7)
        talk = Talk.new(*response.split(" ")[2,6]);
    else
        handle_invalid_input "Unkown object."
    end

end

def handle_print(response)

    # Ensures there is at least one value following the object.
    valid_arguments response

    case response.split(" ")[1].upcase

    when "TALKS"
        correct_number_of_args(response, 3)
        Event.print_event_name response.split(" ")[2]
    else
        handle_invalid_input "Unkown object."
    end

end