# frozen_string_literal: true

require 'fileutils'

# Copied from `rubocop/spec/support/file_helper.rb`
module FileHelper
  def create_file(file_path, content)
    file_path = File.expand_path(file_path)

    dir_path = File.dirname(file_path)
    FileUtils.mkdir_p dir_path

    File.open(file_path, 'w') do |file|
      case content
      when String
        file.puts content
      when Array
        file.puts content.join("\n")
      end
    end

    file_path
  end

  def create_empty_file(file_path)
    create_file(file_path, '')
  end
end
