class Event
    @@events = []

    attr_reader :name, :talks, :speakers

    def initialize(name)

        # Assigns name to instance if unique, else redirects.
        @name = validate_unique_name name
        @talks = []

        @@events.push(self)

        handle_success "The event #{@name} was added!"
    end

    def valid
        return @speaker ? true : false;
    end

    def print_event
        puts @name
        puts @valid ? "YUP" : "NUP"
        puts @@events
    end 

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
    def overlap_redirect(start_time, end_time)
        unless @talks.reduce(true) {|outcome, talk| outcome && !talk.overlaps?(start_time, end_time) }
            handle_validation_fail "Overlaps with existing talks for the #{self.name} event!"
            return false
        end
        return true
    end

    def self.events
        return @@events
    end
end