require_relative "../../src/controllers/app"
require_relative "../../src/controllers/utilities"

describe "utilities_controller" do
    describe '.remove_apos' do
        context 'given a string with apostrophes on either end' do
            it 'removed the apostrophes from either end and returns the string.' do
                expect(remove_apos("'hello world'")).to eq("hello world")
            end
        end
    end

    describe '.com_split' do
        context 'given a string with white space and apostrophe separated arguments' do
            it 'returns an array with the arguments split, but not separating the content of the quoted argument.' do
                expect(com_split("CREATE TALK 'event name' 'talk name' 9:00am 10:00am Dean").length).to eq(7)
            end
        end
    end

    describe '.valid_command' do
        context 'given an empty input' do
            it 'returns false' do
                expect(valid_command("")).to eq(false)
            end
        end
        context 'given an input with unrecognized command' do
            it 'returns false' do
                expect(valid_command("CREMATE EVENT Sample_Event")).to eq(false)
            end
        end
        context 'given an input with recognized command' do
            it 'returns true' do
                expect(valid_command("CREATE TALK Sample")).to eq(true)
            end
        end
    end

    describe 'valid_object' do
        context 'given an empty input' do
            it 'returns false' do
                expect(valid_object("")).to eq(false)
            end
        end
        context 'given an input with unrecognized object' do
            it 'returns false' do
                expect(valid_object("CREATE TASK task_what?")).to eq(false)
            end
        end
        context 'given an input with recognized object' do
            it 'returns true' do
                expect(valid_object("CREATE EVENT event_name")).to eq(true)
            end
        end
    end

    describe 'valid_arguments' do
        context 'given an input with no arguments provided' do
            it 'returns false' do
                expect(valid_arguments("")).to eq(false)
            end
        end      
        context 'given an input with one or more arguments provided' do
            it 'returns true' do
                expect(valid_arguments("CREATE EVENT talk_name")).to eq(true)
            end
        end
    end

    describe 'correct_number_of_args' do
        context 'given an input with the incorrect number of arguments' do
            it 'returns false' do
                expect(correct_number_of_args("one two three four five", 4)).to eq(false)
            end
        end
        context 'given an input with the correct number of arguments' do
            it 'returns true' do
                expect(correct_number_of_args("one two three four five", 5)).to eq(true)
            end
        end
    end
end