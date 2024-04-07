#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "code_snippet_manager/version"
require_relative "code_snippet_manager/configuration"

module CodeSnippetManager
  def self.included(base)
    base.include Configuration
  end
end
