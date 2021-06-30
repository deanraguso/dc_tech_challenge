require_relative "../../src/models/Event"
require_relative "../../src/models/Speaker"
require_relative "../../src/models/Talk"

describe Speaker do
    describe ".initialize" do
        context "given a unique speaker name" do
            it "creates the speaker and saved it to the class." do
                speaker = Speaker.new("Unique Speaker Name")
                expect(Speaker.speakers).to include(speaker)
            end
        end

        context "given a repeated speaker name" do
            it "doesn't save to the class." do 
                Speaker.clear_speakers
                speaker = Speaker.new("Speaker 1")
                speaker = Speaker.new("Speaker 1")
                expect(Speaker.speakers.length).to eq(1)
            end
        end
    end
end