require_relative "../controllers/utilities"

class Speaker
    @@speakers = []

    attr_reader :name

    def initialize(name)
        # If unique sets @name to name, else redirects.
        @name = validate_unique_name name
        @@speakers.push(self)
        handle_success "The speaker #{@name} was added!"
    end

    def print_speaker
        puts @name
    end


    def validate_unique_name(speaker_name)
        if @@speakers.reduce(true) {|outcome, speaker| outcome && (speaker.name != speaker_name)}
            # Speaker name is unique.
            return speaker_name
        else
            handle_validation_fail "That speaker name already exists!"
            return false
        end
    end

    def self.speakers
        return @@speakers
    end
end