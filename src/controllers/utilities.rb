# Utilities for controller validations and common methods.

require "rainbow"
require_relative "../views/utilities"

COMMANDS = ["CREATE", "PRINT", "X", "H"]
OBJECTS = ["EVENT", "SPEAKER", "TALK", "TALKS"]

def remove_apos argument
    argument.delete_prefix('`').delete_suffix('`').delete_prefix("'").delete_suffix("'")
end

def com_split(command)
    command.split(/\s(?=(?:[^']|'[^']*')*$)/)
end

# Validate input is non-empty, and has a supported command.
def valid_command(response)
    unless (com_split(response).length > 0) && (COMMANDS.include? com_split(response)[0].upcase)
        puts com_split(response)[0].upcase
        handle_invalid_input "Valid command not provided. 'CREATE' or 'PRINT'"
        return false
    end
    return true
end

def valid_object(response)
    unless (com_split(response).length > 1) && (OBJECTS.include? com_split(response)[1].upcase)
        handle_invalid_input "Valid object not provided. 'EVENT', 'SPEAKER', 'TALK', or 'TALKS'"
        return false
    end
    return true
end

def valid_arguments(response)
    unless (com_split(response).length > 2)
        handle_invalid_input "No arguments provided."
        return false
    end
    return true
end

def correct_number_of_args(response, n)
    unless (com_split(response).length == n)
        handle_invalid_input "Wrong number of arguments specified."
        return false
    end
    return true
end