require_relative "../controllers/utilities"
require_relative "../views/utilities"

class Event
    @@events = []

    attr_reader :name, :talks, :speakers

    def initialize(name)

        # Assigns name to instance if unique, else redirects.
        @name = validate_unique_name(remove_apos(name))
        if @name
            @talks = []

            @@events.push(self)

            handle_success "The event #{@name} was created!"
        end
    end

    # Print the schedule associated with this event.
    def print_event
        clear
        @talks.sort_by {|task| task.start_time }.each do |t|
            puts "#{t.start_time.strftime("%I:%M%p").delete_prefix("0").downcase} - #{t.end_time.strftime("%I:%M%p").delete_prefix("0").downcase}"
            puts "  #{t.name} presented by #{t.speaker.name}"
        end
        puts
    end 

    # Adds talk to event, must be validated before_hand.
    def add_talk(talk)
        @talks.push(talk)
    end

    # Checks that event name is unique, returns if it is, else redirects.
    def validate_unique_name(name)
        if @@events.reduce(true) {|outcome, event| outcome && (event.name != name)}
            # Event name is unique.
            return name
        else
            handle_validation_fail "That event name already exists!"
            return false
        end
    end

    # Checks that a talks start and end time don't overlap with a talk within this event.
    def overlaps?(start_time, end_time)
        unless @talks.reduce(true) {|outcome, talk| outcome && !talk.overlaps?(start_time, end_time) }
            handle_validation_fail "Overlaps with existing talks in the #{self.name} event!"
            return true
        end
        return false
    end

    # Class Methods

    # Returns all events in array.
    def self.events
        return @@events
    end

    # Prints event if it exists, else redirects.
    def self.print_event_name(event_name)
        event_name = remove_apos(event_name)
        if Event.events.reduce(false) {|outcome, event| outcome || (event.name == event_name)}
            # Event exists, find it and print it's events.
            Event.events.select{ |e| e.name == event_name }[0].print_event
            return true
        else
            # Event didn't exist, print validation error and redirect to menu.
            handle_validation_fail "That event doesn't exist!"
            return false
        end
    end

    # Events clear for testing purposes.
    def self.clear_events
        @@events = []
    end
end