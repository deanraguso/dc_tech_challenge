class Event
    @@events = []

    attr_reader :name, :talks, :speakers

    def initialize(name)
        @name = name
        @talks = []
        @@events.push(self)
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

    def self.events
        return @@events
    end
end