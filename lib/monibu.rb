# frozen_string_literal: true

require_relative "monibu/version"

module Monibu
  class Error < StandardError; end

  require 'monibu/railtie' if defined?(Rails)
end
