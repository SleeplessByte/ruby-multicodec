# frozen_string_literal: true

require 'multicodecs/version'
require 'multicodecs/bare'
require 'csv'

module Multicodecs
  load_csv CSV.open(File.join(__dir__, 'table.csv'), headers: true)
end
