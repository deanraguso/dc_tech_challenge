class Speaker
    @@speakers = []

    attr_reader :name

    def initialize(name)
        @name = name

        # Validate me
        @@speakers.push(self)
    end

    def print_speaker
        puts @name
    end

    def self.speakers
        return @@speakers
    end
end