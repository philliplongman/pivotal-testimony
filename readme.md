# Pivotal Tracker Feature Exporter

I write my team's user stories, and I'm tired of some of the repetition it takes to put things together after I write them. So, I wrote a simple Sinatra app to let the devs format the stories for testing automatically.

We like to have a summary & checklist of criteria to drop in at the top of our feature tests, like this:

```ruby
feature "Phillip cuts down on his workload -" do

  # As a Product Manager,
  # I want to automate producing these comment blocks,
  # so that I can stop doing so much busy work.
  #
  # Acceptance Criteria:
  # [ ] When I visit the Heroku app, I should be able to enter a story ID into
  #     the form (with or without the "#").
  # [ ] When I press "Testify!" it should load the story with Pivotal Tracker's
  #     API using the tracker_api gem.
  # [ ] The story should be output as a preformatted text block, like this one.
  # [ ] The description should be on top, excluding everything under "NOTES:".
  # [ ] The tasks should be exported as a checklist.
  # [ ] Each line should be wrapped and indented to no more than 76 characters,
  #     so it will fit properly in the test when indented and commented out.
```
