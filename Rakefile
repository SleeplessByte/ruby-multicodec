require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

Rake::Task.define_task(:update) do |t|
  require 'open-uri'

  SOURCE_FILE = 'https://raw.githubusercontent.com/multiformats/multicodec/master/table.csv'

  File.open(File.join(__dir__, 'lib', 'table.csv'), 'wb') do |saved_file|
    URI.open(SOURCE_FILE, 'rb') do |read_file|
      saved_file.write(read_file.read)
    end
  end
end

task :default => :test
