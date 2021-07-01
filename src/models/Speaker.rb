require_relative "../controllers/utilities"
require_relative "../views/utilities"

class Speaker
    @@speakers = []

    attr_reader :name

    def initialize(name)
        # If unique sets @name to name, else redirects.
        @name = validate_unique_name(remove_apos(name))
        if @name
            @@speakers.push(self)
            handle_success "The speaker #{@name} was created!"
        end
    end


    def validate_unique_name(speaker_name)
        speaker_name = remove_apos(speaker_name)
        if @@speakers.reduce(true) {|outcome, speaker| outcome && (speaker.name != speaker_name)}
            # Speaker name is unique.
            return speaker_name
        else
            handle_validation_fail "That speaker name already exists!"
            return false
        end
    end

    # Returns class storage of all speakers.
    def self.speakers
        return @@speakers
    end

    def self.clear_speakers
        @@speakers = []
    end
end