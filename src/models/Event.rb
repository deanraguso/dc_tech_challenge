class Event
    @@events = []

    def initialize(name)
        @name = name
        @events = []
        @speaker = nil
        @@events.push(self)
    end

    def print
        puts @name
        puts @@events
    end 
end