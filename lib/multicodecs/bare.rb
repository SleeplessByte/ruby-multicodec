# frozen_string_literal: true

require_relative './registry'

module Multicodecs

  module_function

  def load_csv(csv, radix: 16)
    csv.each do |row|
      name = row['name'] || row[0]
      tag = row['tag']  || row[1]
      code = row['code'] || row[2]
      status = row['status'] || row[3]
      description = row['description'] || row[4]

      Multicodecs.register(
        name: name.strip,
        tag: tag.strip,
        code: code.strip.to_i(16),
        status: status.strip,
        description: description&.strip
      )
    end
  end
end
