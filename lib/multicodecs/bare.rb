# frozen_string_literal: true

require_relative './registry'

module Multicodecs

  module_function

  def load_csv(csv, radix: 16)
    csv.each do |row|
      name  = row['name'] || row[0]
      tag   = row['tag'] || row[1]
      code  = row['code'] || row[2]

      Multicodecs.register(name: name.strip, tag: tag.strip, code: code.strip.to_i(16))
    end
  end
end
