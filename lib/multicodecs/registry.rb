# frozen_string_literal: true

module Multicodecs
  # rubocop:disable Style/MutableConstant
  REGISTRATIONS = {}
  # rubocop:enable Style/MutableConstant

  Registration = Struct.new(:code, :name, :tag) do
    def hash
      name.hash
    end

    def ==(other)
      return name == other if other.is_a?(String)
      return code == other if other.is_a?(Integer)

      eql?(other)
    end

    def eql?(other)
      other.is_a?(Registration) && other.name == name
    end
  end

  module_function

  def [](entry)
    find_by(code: entry, name: entry)
  end

  def register(code:, name:, tag:)
    Multicodecs::REGISTRATIONS[name] = Registration.new(
      code,
      name,
      tag
    )
  end

  def fetch_by!(code: nil, name: nil)
    return Multicodecs::REGISTRATIONS.fetch(name) if name

    Multicodecs.find_by(code: code).tap do |found|
      raise KeyError, "No codec has code #{code}" unless found
    end
  end

  def find_by(code: nil, name: nil)
    Multicodecs::REGISTRATIONS.values.find do |v|
      v == code || v == name
    end
  end

  def codes
    Multicodecs::REGISTRATIONS.values.map(&:code)
  end

  def names
    Multicodecs::REGISTRATIONS.keys
  end
end
