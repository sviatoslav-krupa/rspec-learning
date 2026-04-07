# Notes:
#   * `before` and `after` hooks are used to run code before or after each example
#   * `before(:context)` and `after(:context)` hooks are used to run code before or after the entire context in which the examples are defined
#   * `before(:suit)` and `after(:suit)` hooks are used to run code before or after the entire suite of examples
#   * `before(:suite)` and `after(:suite)` hooks only available on the RSpec configuration object, not in the example group

describe 'before and after hooks' do

  # Or `before(:all)`
  before(:context) do
    puts 'Before context'
  end

  # Or `after(:all)`
  after(:context) do
    puts 'After context'
  end

  # Or `before(:each)`, or just `before`
  before(:example) do
    puts 'Before example'
  end

  # Or `after(:each)`, or just `after`
  after(:example) do
    puts 'After example'
  end

  it 'is just a random example' do
    expect(5 * 4).to eq(20)
  end

  it 'is just another random example' do
    expect(3 - 2).to eq(1)
  end
end
# OUTPUT:
#
#   before and after hooks
#   Before context
#   Before example
#   After example
#     is just a random example
#   Before example
#   After example
#     is just another random example
#   After context
#
#   Finished in 0.0006 seconds (files took 0.03308 seconds to load)
#   2 examples, 0 failures

# Edge cases:
describe 'before and after suit hooks' do
  before(:each) do
    puts 'Before context'
  end

  after(:suite) do
    puts 'After suite'
  end

  context 'when testing' do
    before(:suite) do
      puts 'Before suite'
    end

    it 'is just a random example' do
      expect(5 * 4).to eq(20)
    end
  end
end
# OUTPUT:
# 
#   WARNING: `after(:suite)` hooks are only supported on the RSpec configuration object. This `after(:suite)` hook, registered on an example group, will be ignored. Called from /Users/sviatoslav-krupa/Projects/rspec-learning/spec/02__basics/11__before_and_after_hooks_spec.rb:57:in 'block in <top (required)>'.
#   WARNING: `before(:suite)` hooks are only supported on the RSpec configuration object. This `before(:suite)` hook, registered on an example group, will be ignored. Called from /Users/sviatoslav-krupa/Projects/rspec-learning/spec/02__basics/11__before_and_after_hooks_spec.rb:62:in 'block (2 levels) in <top (required)>'.
#   Before context
#   .

#   Finished in 0.00244 seconds (files took 0.03725 seconds to load)
#   1 example, 0 failures
