# frozen_string_literal: true

require 'yaml'

# This is module TsvBuddy!
module YamlBuddy
  # take_yaml: takes a yaml string and converts it into a data structure in @data.
  # parameter: yaml - a String in TSV format
  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
  end

  def to_yaml
    @data = @data.to_yaml
  end
end
