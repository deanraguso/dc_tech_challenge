require_relative "../controllers/utilities"
require_relative "../controllers/app"
require_relative "Event"

class Talk

    attr_reader :name, :event_name

    def initialize(event_name, name, start_time, end_time, speaker_name)
        
        # Find the related event if valid, else redirects.
        @event = valid_event event_name
        p @event.talks

        # Validates the talk name is unique.
        @name = validate_unique_name name 
         

        # VALIDATE
        @start_time = Time.parse(start_time)
        @end_time = Time.parse(end_time)

        # Find the related speaker, else redirects.
        @speaker_name = speaker_name

        # Talk is valid, push to event.
        @event.add_talk(self)
    end

    def print_task
        puts @event_name
        puts @name
        puts @start_time
        puts @end_time
        puts @speaker
    end

    # Returns name if unique, else redirects.
    def validate_unique_name(name)
        if @event.talks.reduce(true) {|outcome, talk| outcome && (talk.name != name)}
            return name
        else
            handle_validation_fail "Task name is already taken!"
        end
    end

    # Returns event object if it exists, else redirects.
    def valid_event(event_name)
        if Event.events.reduce(false) {|outcome, event| outcome || (event.name == event_name)}
            # Event exists, find it and return it.
            return Event.events.select{ |e| e.name == event_name }[0]
        else
            # Event didn't exist, print validation error and redirect to menu.
            handle_validation_fail "That event doesn't exist!"
            return false
        end
    end

end