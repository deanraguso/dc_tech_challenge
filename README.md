# Delegate Connect - Technical Challenge
#### Author: Dean Raguso  

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

## Pseudocode

**Handling Commands**
1. Split the command into keywords.
2. Enter words into switch statement to decide action.
3. Call the associated action.
4. To print an event, call the event's printing method.

**Building Events**
1. Pass event name through class constructor.
2. Use class methods to add speakers and talks to the class object.
3. Use class method to print event time-table.

(Talks should also be an object)