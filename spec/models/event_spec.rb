require_relative "../../src/models/Event"
require_relative "../../src/models/Speaker"
require_relative "../../src/models/Talk"

describe Event do
    describe ".initialize" do 
        context "given a unique name" do
            it "creates and stores the event." do
                event = Event.new("Unique Name")
                expect(Event.events).to include(event)
            end
        end

        context "given a repeating name" do
            it "doesn't store the event." do
                Event.clear_events
                event1 = Event.new("Name");
                event2 = Event.new("Name");
                expect(Event.events.length).to eq(1) 
            end
        end
    end

    describe ".add_talk" do
        context "given a talk object" do
            it "stores object within the event." do
                event = Event.new("Unique Name")
                event.add_talk({name: "Fake Talk Object"})
                expect(event.talks.length).to eq(1)
            end
        end
    end

    describe ".print_event" do
        context "given a set of sample talks" do
            it "prints the talks to the console as predicted." do
                Event.clear_events
                Speaker.clear_speakers

                event = Event.new("Sample Event")
                speaker = Speaker.new("John")
                
                Talk.new(event.name,
                    "Talk One",
                    "8:15am",
                    "9:45am",
                    speaker.name)
                
                # Tests for correct output, using Regex because of anoying placement error.
                expect {event.print_event}.to output(/#{Regexp.quote("8:15am - 9:45am\n  Talk One presented by John")}/).to_stdout
            end
        end
    end

    describe ".print_event_name" do
        context "given the name of an event that exists" do
            it "prints the talks to the console as predicted." do
                Event.clear_events
                Speaker.clear_speakers

                event = Event.new("Sample Event")
                speaker = Speaker.new("John")
                
                Talk.new(event.name,
                    "Talk One",
                    "8:15am",
                    "9:45am",
                    speaker.name)
                
                expect {Event.print_event_name event.name}.to output(/#{Regexp.quote("8:15am - 9:45am\n  Talk One presented by John")}/).to_stdout
            end
        end

        context "given the name of an event that doesn't exist" do
            it "returns false." do
                Event.clear_events
                
                # Tests for correct output, using Regex because of anoying placement error.
                expect(Event.print_event_name "Sample Event").to eq(false)
            end
        end
    end
end