module PivotalTestimony
  module Models
    class Feature
      attr_reader :name, :labels, :description, :tasks

      def initialize(story)
        @name = story.name
        labels = story.labels || []
        @labels = labels.map(&:name)
        @description = story.description
        @tasks = story.tasks.map(&:description)
      end

      def comment_block
        export = []
        export << LineWrapper.wrap_scenario(scenario)
        export << "Acceptance Criteria:"
        tasks.each { |task| export << LineWrapper.wrap_task(task) }
        export * "\n"
      end

      private

      def scenario
        @scenario ||= begin
          return "" if description.nil?
          description.split(notes_section_header).first.strip
        end
      end

      def notes
        @notes ||= begin
          return "" if description.nil?
          description.split(notes_section_header).laststrip
        end
      end

      def notes_section_header
        /notes(:)?\n/i
      end

    end
  end
end
