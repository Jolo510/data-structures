# Rakefile
require 'rake/testtask'

# Define a task to run all tests
Rake::TestTask.new do |t|
  t.libs << '.'           # Add the current directory to the load path
  t.pattern = '*_test.rb' # Specify the pattern to find test files
  t.verbose = true       # Optional: print the names of tests being run
end

# Define the default task
task default: :test