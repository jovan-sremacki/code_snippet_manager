# frozen_string_literal: true

require_relative "code_snippet_manager/version"
require "tty-prompt"

# Main module for the lib
module CodeSnippetManager
  def self.run
    choice = generate_prompt_choice

    case choice
    when :add
      puts "add"
    when :list
      puts "list"
    end
  end

  private

  def generate_prompt_choice
    prompt = TTY::Prompt.new
    prompt.select("Choose your action:") do |menu|
      menu.choice name: "Add a new snippet", value: :add
      menu.choice name: "List all snippets", value: :list
    end
  end
end
