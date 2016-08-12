module PivotalTestimony
  module Models
    class LineWrapper
      def self.wrap_scenario(text)
        word_wrap(text, line_width: 76) + "\n"
      end

      def self.wrap_task(text)
        lines = word_wrap(text, line_width: 72).split("\n")
        lines.map! { |line| line.prepend "    " }
        lines.first.sub!("   ", "[ ]")
        lines * "\n"
      end

      private

      def self.word_wrap(text, options = {})
        line_width = options.fetch(:line_width, 80)
        regex = /(.{1,#{line_width}})(\s+|$)/

        text.split("\n").collect! do |line|
          line.length > line_width ? line.gsub(regex, "\\1\n").strip : line
        end * "\n"
      end

    end
  end
end
