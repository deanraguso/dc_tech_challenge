class Talk
    def initialize(event_name, name, start_time, end_time, speaker)
        @name = name
        @event_name = event_name
        @start_time = Time.parse(start_time)
        @end_time = Time.parse(end_time)
        @speaker = speaker
    end

    def print
        puts @event_name
        puts @name
        puts @start_time
        puts @end_time
        puts @speaker
    end
end