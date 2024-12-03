# frozen_string_literal: true

module Multicodecs
  class AutoHashCollection < Hash
    def [](key)
      self[key] = [] unless key?(key)
      super
    end
  end

  # rubocop:disable Style/MutableConstant
  REGISTRATIONS = {}
  REGISTRATIONS_PER_TAG = AutoHashCollection.new
  # rubocop:enable Style/MutableConstant

  class Registration
    STATUS_DRAFT = 'draft'
    STATUS_PERMANENT = 'permanent'

    attr_reader :code, :tag, :name, :status, :description

    def initialize(code:, name:, tag:, status:, description:)
      self.code = code
      self.name = name
      self.tag = tag
      self.status = status
      self.description = description
    end

    def permanent?
      status == STATUS_PERMANENT
    end

    def draft?
      status == STATUS_DRAFT
    end

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

    def to_s
      "0x#{code.to_s(16)}"
    end

    def inspect
      "#{to_s} #{name} (#{tag}/#{status}): #{description || '(no description)'}"
    end

    private

    attr_writer :code, :tag, :name, :status, :description
  end

  module_function

  def [](entry)
    find_by(code: entry, name: entry)
  end

  def register(name:, tag:, **kwargs)
    Registration.new(name: name, tag: tag, **kwargs).tap do |registration|
      Multicodecs::REGISTRATIONS[name] = registration
      Multicodecs::REGISTRATIONS_PER_TAG[tag] << registration
    end
  end

  def fetch_by!(code: nil, name: nil)
    return Multicodecs::REGISTRATIONS.fetch(name) if name

    Multicodecs.find_by(code: code).tap do |found|
      raise KeyError, "No codec has code #{code}" unless found
    end
  end

  alias find_by! fetch_by!

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

  def tags
    Multicodecs::REGISTRATIONS_PER_TAG.keys
  end

  def where(tag:)
    Multicodecs::REGISTRATIONS_PER_TAG[tag]
  end

  def each(tag: nil)
    arr = tag.nil? ? Multicodecs::REGISTRATIONS.values : Multicodecs.where(tag: tag)

    if block_given?
      return arr.each { |registration| yield registration }
    end

    arr.each
  end
end
