# Notes:
#   * `satisfy` matcher is used to test if a value satisfies a given condition
#   * It passes if the provided block returns true

# Docs:
#   * https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/satisfy/

describe 'satisfy matcher' do
  subject { 'racecar' }

  it 'is a palindrome' do
    expect(subject).to satisfy { |value| value == value.reverse  }
  end
end
# OUTPUT:
#
#   satisfy matcher
#     is a palindrome
#
#   Finished in 0.00107 seconds (files took 0.04736 seconds to load)
#   1 example1, 0 failures

# Edge cases:
describe 'satisfy matcher' do
  subject { 'racecars' }

  it 'can accept a custom error message' do
    expect(subject).to satisfy('be a palindrome') do |value|
      value == value.reverse
    end
  end
end
# OUTPUT:
#
#   satisfy matcher
#     can accept a custom error message (FAILED - 1)
# 
#   Failures:
#
#     1) satisfy matcher can accept a custom error message
#        Failure/Error:
#          expect(subject).to satisfy('be a palindrome') do |value|
#            value != value.reverse
#          end
#  
#          expected "racecars" to be a palindrome
#        # ./spec/04__built-in-matchers/14__satisfy_matcher_spec.rb:35:in 'block (2 levels) in <top (required)>'
# 
#   Finished in 0.00384 seconds (files took 0.0685 seconds to load)
#   1 example, 1 failure
#
#   Failed examples:
# 
#   rspec ./spec/04__built-in-matchers/14__satisfy_matcher_spec.rb:34 # satisfy matcher can accept a custom error message
