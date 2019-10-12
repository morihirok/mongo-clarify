# frozen_string_literal: true

if Gem::Version.create(RUBY_VERSION) >= Gem::Version.create('2.7')
  require_relative 'investigate_with_pattern_matching'
else
  require_relative 'investigate_without_pattern_matching'
end


