# frozen_string_literal: true

module CodeSnippetManager
  module Configuration
    def self.included(base)
      base.include InstanceMethods
      base.extend ClassMethods
    end

    module ClassMethods
      def init(&block)
        return unless block_given?

        @init_block = block
      end
    end

    module InstanceMethods
      FIELDS = {
        title: {
          type: :string,
          prompt: "What is the title of your snippet?",
          required: true,
        },
        code: {
          type: :string,
          prompt: "Paste your code here:",
          required: true,
        },
        tags: {
          type: :array,
          prompt: "Enter tags (comma separated):",
          convert: ->(input) {
            input.split(",").map(&:strip)
          },
        },
        category: {
          type: :select,
          choices: %w[JavaScript Ruby Python C++ Other],
          prompt: "Choose the category:",
        },
        description: {
          type: :string,
          prompt: "Enter a description (optional):",
        },
        language: {
          type: :select,
          choices: %w[Ruby Python JavaScript C++ Other],
          prompt: "Programming language:",
        },
      }

      attr_accessor :cats, :tags, :programming_languages, :required_fields

      def initialize
        @cats = []
        @tags = []
        @programming_languages = []
        @required_fields = []

        self.class.instance_variable_get(:@init_block).is_a?(Proc) &&
          instance_exec(&self.class.instance_variable_get(:@init_block))

        freeze
      end

      def categories(*cats)
        @cats = cats
      end

      def tags(*tags)
        @tags = tags
      end

      def programming_languages(*langs)
        @programming_languages = langs
      end

      def required_fields(*fields)
        @required_fields = fields
      end
    end
  end
end
