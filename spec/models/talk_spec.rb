require_relative "../../src/models/Event"
require_relative "../../src/models/Speaker"
require_relative "../../src/models/Talk"

describe Talk do
    describe '.initialize' do

        context "given a non-existent event" do
            it "doesn't create the talk." do
                Event.clear_events
                speaker = Speaker.new("John")

                talk = Talk.new("Non-Existent Event",
                    "Sample Talk",
                    "8:15am",
                    "9:45am",
                    speaker.name)
                
                # Implies the event wasn't implicitly created, thus task wasn't stored.
                expect(Event.events.length).to eq(0)
            end
        end

        context 'given a valid event with an invalid speaker' do
            it "doesn't create the talk." do
                Event.clear_events
                Speaker.clear_speakers
                
                event = Event.new("Sample Event")

                talk = Talk.new("Sample Event",
                    "Sample Talk",
                    "8:15am",
                    "9:45am",
                    "Fake Speaker")
                
                expect(event.talks.length).to eq(0)
            end
        end
        
        context "given a completely valid talk command" do
            it "creates and adds the talk." do
                Event.clear_events
                Speaker.clear_speakers
                
                event = Event.new("Sample Event")
                speaker = Speaker.new("John")

                talk = Talk.new(event.name,
                    "Sample Talk",
                    "8:15am",
                    "9:45am",
                    speaker.name)
                
                expect(event.talks).to include(talk)
            end
        end

        context "given a valid event and valid speaker but overlapping time-slot" do
            it "doesn't create the talk." do
                Event.clear_events
                Speaker.clear_speakers
                
                event = Event.new("Sample Event")
                speaker = Speaker.new("John")

                talk1 = Talk.new(event.name,
                    "Sample Talk 1",
                    "9:30am",
                    "10:30am",
                    speaker.name)

                talk2 = Talk.new(event.name,
                    "Sample Talk 2",
                    "10:00am",
                    "10:30am",
                    speaker.name)
                
                expect(event.talks.length).to eq(1) 
            end
        end

    end
end