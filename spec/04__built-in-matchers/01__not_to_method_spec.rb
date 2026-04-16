# Notes:
#   * `not_to` checks that two values do not match; checks for the inverse of a matcher

# Docs:
#  * https://www.rubydoc.info/gems/rspec-expectations/2.14.4/RSpec%2FExpectations%2FExpectationTarget:not_to

describe 'not_to method' do
  it 'checks that two values do not match' do
    expect(5).not_to        eq(10)
    expect('Hello').not_to  eq('hello')
    expect([1, 2]).not_to   eq([1, 2, 3])
  end

  it 'checks for the inverse of a matcher' do
    expect(5).not_to              eq(10)
    expect([1, 2, 3]).not_to      equal([1, 2, 3])
    expect(10).not_to             be_odd
    expect([1, 2, 3]).not_to      be_empty
    expect(nil).not_to            be_truthy
    expect('Philadelphia').not_to start_with('car')
    expect('Philadelphia').not_to end_with('city')
    expect(5).not_to              respond_to(:length)
    expect([:a, :b, :c]).not_to   include(:d)
    expect { 11 / 3 }.not_to      raise_error
  end
end
# OUTPUT:
#
#   not_to method
#     checks that two values do not match
#     checks for the inverse of a matcher
#
#   Finished in 0.00373 seconds (files took 0.04714 seconds to load)
#   2 examples, 0 failures
