class Event
    @@events = []

    attr_reader :name, :talks, :speakers

    def initialize(name)

        # Assigns name to instance if unique, else redirects.
        @name = validate_unique_name name
        if @name
            @talks = []

            @@events.push(self)

            handle_success "The event #{@name} was created!"
        end
    end

    def valid
        return @speaker ? true : false;
    end

    def print_event
        system "clear"
        @talks.each do |t|
            puts "#{t.start_time.strftime("%I:%M%p")} -  #{t.end_time.strftime("%I:%M%p")}"
            puts "  #{t.name} presented by #{t.speaker.name}"
        end
        puts
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

    def self.print_event_name(event_name)
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
end