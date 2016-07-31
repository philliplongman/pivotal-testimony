# Pivotal Testimony

I write my team's user stories, and I'm tired of some of the repetition it takes to put things together after I write them. So, I'm making some software to automate the process. This is a simple Sinatra app to let the devs export the stories for use in spec files, so that I don't have to do it.

We like to have a summary & checklist of criteria to drop in at the top of our feature tests, like this:

```ruby
feature "Phillip cuts down on his workload -" do

  # As a Product Manager,
  # I want to automate producing these comment blocks,
  # so that I can do less busy work.
  #
  # Acceptance Criteria:
  # [ ] When I visit the Heroku app, I should be able to select a project and
  #     enter a story ID (with or without the "#").
  # [ ] When I press "Testify!" it should load the story with Pivotal Tracker's
  #     API using the tracker_api gem.
  # [ ] The story should be output as a preformatted text block, like this one.
  # [ ] The description should be on top, excluding everything under "NOTES:".
  # [ ] The tasks should be exported as a checklist.
  # [ ] Each line should be wrapped and indented to no more than 76 characters,
  #     so it will fit properly in the test when indented and commented out.
```

## To do
- Put something up top.
- Error handling for incorrect story IDs.
- Find a way to "log in" with your API token which gets persisted, so anyone can use the app.
- Store last selected project in cookie.
- Wrap export logic in a gem, so this an be done on the command line.
