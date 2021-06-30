require_relative "../controllers/utilities"
require_relative "../views/utilities"
require_relative "../controllers/app"
require_relative "Event"
DAY_IN_SECONDS = 86400

class Talk

    attr_reader :name, :event_name, :start_time, :end_time, :speaker

    def initialize(event_name, name, start_time, end_time, speaker_name)
        
        # Find the related event if valid, else redirects.
        @event = validate_event remove_apos(event_name)

        if @event
            # Validates the talk name is unique.
            @name = validate_unique_name remove_apos(name)

            if @name
                # Find the related speaker, else redirects.
                @speaker = validate_speaker remove_apos(speaker_name)

                if @speaker
                    # Parse in start and end time, then check it doesn't overlap with any other talk in the event.
                    @start_time = Time.parse(start_time)
                    @end_time = Time.parse(end_time)
                    
                    # Time Validation and adjustments, forces end time to be after start.
                    @end_time = @end_time < @start_time ? @end_time + DAY_IN_SECONDS : @end_time;
                    overlap_check = @event.overlaps?(@start_time, @end_time)

                    if !overlap_check
                        # Talk is valid, push to event.
                        @event.add_talk(self)
                        handle_success "#{@name} was added to the #{@event.name} event!"
                    end
                end
            end
        end
    end

    # Returns name if unique, else redirects.
    def validate_unique_name(name)
        if @event.talks.reduce(true) {|outcome, talk| outcome && (talk.name != name)}
            return name
        else
            handle_validation_fail "Talk name is already used on this event!"
        end
    end

    # Returns assoicated speaker iff exists, else redirects.
    def validate_speaker(speaker_name)
        if Speaker.speakers.reduce(false) {|outcome, speaker| outcome || (speaker.name == speaker_name)}
            # Event exists, find it and return it.
            return Speaker.speakers.select{ |s| s.name == speaker_name }[0]
        else
            # Event didn't exist, print validation error and redirect to menu.
            handle_validation_fail "That speaker doesn't exist!"
            return false
        end
    end

    # Returns event object if it exists, else redirects.
    def validate_event(event_name)
        if Event.events.reduce(false) {|outcome, event| outcome || (event.name == event_name)}
            # Event exists, find it and return it.
            return Event.events.select{ |e| e.name == event_name }[0]
        else
            # Event didn't exist, print validation error and redirect to menu.
            handle_validation_fail "That event doesn't exist!"
            return false
        end
    end

    # Returns true if the start and end time overlap with current talk.
    def overlaps?(start_time, end_time)
        # If the start or end time is between this talks start and end time, it overlaps.
        starts_within = ((start_time <= @end_time) && (start_time >= @start_time))
        ends_within = ((end_time <= @end_time) && (end_time >= @start_time))  
        wraps_around = ((end_time >= @end_time) && (start_time <= @start_time))

        # If any of the above is true, there is an overlap with self.
        return starts_within || ends_within || wraps_around
    end
end