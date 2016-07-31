class Feature

  attr_reader :name, :labels

  def initialize(story)
    @name = story.name
    @labels = story.labels.map(&:name)
    @description = story.description
    @tasks = story.tasks.map(&:description)
  end

  def export
    export = []
    export << LineWrapper.wrap_scenario(scenario)
    tasks.each do |task|
      export << LineWrapper.wrap_task(task)
    end
    export * "\n"
  end

  private

  attr_reader :description, :tasks

  def scenario
    @scenario ||= description.split(notes_section_header).first.strip
  end

  def notes
    @notes ||= description.split(notes_section_header).last.strip
  end

  def notes_section_header
    /notes(:)?\n/i
  end
end
