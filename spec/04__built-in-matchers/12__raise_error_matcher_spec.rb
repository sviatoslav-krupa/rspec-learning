# Docs:
#   * https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/raise-error/

describe 'raise_error matcher' do
  def some_method
    x
  end

  class CustomError < StandardError; end

  it 'can check for a specific error being raised' do
    expect { some_method }.to raise_error
    expect { some_method }.to raise_error(NameError)
    expect { 10 / 0 }.to      raise_error(ZeroDivisionError)
  end

  it 'can check for a user-created error' do
    expect { raise CustomError }.to raise_error(CustomError)
  end
end
# OUTPUT:
#
#   raise_error matcher
#   WARNING: Using the `raise_error` matcher without providing a specific error or message risks false positives,
#   since `raise_error` will match when Ruby raises a `NoMethodError`, `NameError` or `ArgumentError`,
#   potentially allowing the expectation to pass without even executing the method you are intending to call.
#   Actual error raised was #<NameError: undefined local variable or method 'x'
#   for #<RSpec::ExampleGroups::RaiseErrorMatcher:0x000000011f7c3bf0>>. Instead consider providing a specific error class or message.
#   This message can be suppressed by setting: `RSpec::Expectations.configuration.on_potential_false_positives = :nothing`.
#   Called from /Users/sviatoslav-krupa/Projects/udemy-rspec/spec/04__built-in-matchers/12__raise_error_matcher_spec.rb:12:in 'block (2 levels) in <top (required)>'.
#     can check for a specific error being raised
#     can check for a user-created error
#
#   Finished in 0.00129 seconds (files took 0.04736 seconds to load)
#   2 examples, 0 failures
