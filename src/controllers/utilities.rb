def greeting
    puts "Welcome to Mad Events planner.\n\n"
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

def handleMenu
    
end