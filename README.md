# Delegate Connect - Technical Challenge
#### Author: Dean Raguso  

## Usage
1. Navigate terminal to the root directory of application.
2. Execute the run script, linux "./run.sh".
   1. If you can't, bundle install gem dependencies.
   2. Move into the src directory.
   3. Run the index.rb file using Ruby, "ruby index.rb".
3. Once in the application, type "h" and enter for available commands.
## Challenge (Short)
Create a system that allows clients to create virtual events, and have the schedule be printable.

## Features
A use can...
- Create an event.
- Add a speaker to the event.
- Add a talk to the event.
- Print the event schedule.

The application...
- Validates event details upon print.
  - It must have at least 1 speaker to be a valid event.
- Validates talks such that...
  - There is a valid speaker.
  - The talk doesn't overlap with other talks.

## Tech Stack
- Ruby
- Shell