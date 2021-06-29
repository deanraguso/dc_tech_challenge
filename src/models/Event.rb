class Event
    def initialize(name)
        @name = name
        @events = []
        @speaker = nil
    end

    def print
        puts @name
    end 

end