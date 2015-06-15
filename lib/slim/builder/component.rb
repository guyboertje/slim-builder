require 'slim'

module Slim
  module Builder
    class Component
      def self.build(slim_string, scope = nil, options = {}, &block)
        component = self.new(options, scope)
        component.build(slim_string, &block)
      end

      attr_reader :options, :indent, :scope, :template

      def initialize(options = {}, scope = nil)
        # slim templating options
        @options = options
        @scope = scope 
        @indent = 1
      end

      def build(slim_string, scope = nil, &block)
        compile(slim_string, &block).finalize(scope)
      end

      def compile(slim_string, &block)
        compound = "#{slim_string}\r\n#{' '*(@indent * 2)}#{incr(block)}\r\n"
        @template = Slim::Template.new(options) { compound }
        self
      end

      def finalize(context = nil)
        @scope = context if !context.nil?
        template.render(context || scope)
      end

      private

      def incr(block)
        return '' if block.nil?
        oldindent, @indent = @indent, @indent.next
        result = block.call(self)
        @indent = oldindent
        result
      end
    end
  end
end
