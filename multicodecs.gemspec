# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multicodecs/version'

Gem::Specification.new do |spec|
  spec.name          = 'multicodecs'
  spec.version       = Multicodecs::VERSION
  spec.authors       = ['Derk-Jan Karrenbeld']
  spec.email         = ['derk-jan+github@karrenbeld.info']

  spec.summary       = 'Ruby implementation of the multicodec specification'
  spec.description   = %q(
    This gem provides a PORO of the multicodec table for use with other
    multiformat ruby gems.
  ).strip
  spec.homepage = 'https://github.com/SleeplessByte/ruby-multicodec'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this section
  # to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/SleeplessByte/ruby-multicodec'
    spec.metadata['changelog_uri'] = spec.metadata['source_code_uri'] +
                                     '/blog/master/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  # into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
