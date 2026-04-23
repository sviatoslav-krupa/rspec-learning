# Notes:
#   * `expect { ... }` or `expect do ... end` checks that a block of code changes some mutable state

# Docs:
#   * https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/change/

describe 'change matcher' do
  subject { [1, 2, 3] }

  it 'checks that a method changes object state' do
    # Or `expect { subject.push(4) }.to change { subject.length }.from(3).to(4)`
    expect { subject.push(4) }.to change { subject.length }.by(1)
    expect { subject.push(4) }.to change(subject, :length).by(1)
  end

  it 'accepts negative arguments' do
    # Or `expect { subject.pop }.to change { subject.length }.from(4).to(3)`
    expect(-> { subject.pop }).to change { subject.length }.by(-1) # actually, passing lambda to expectation
    expect { subject.pop }.to change(subject, :length).by(-1)
  end
end
# OUTPUT:
#
#   change matcher
#     checks that a method changes object state
#     accepts negative arguments
#
#   Deprecation Warnings:
#
#   The implicit block expectation syntax is deprecated, you should pass a block rather than an argument to `expect`
#   to use the provided block expectation matcher or the matcher must implement `supports_value_expectations?`.
#   e.g  `expect { value }.to change `subject.length` by -1` not `expect(value).to change `subject.length` by -1`
#
#   If you need more of the backtrace for any of these deprecations to
#   identify where to make the necessary changes, you can configure
#   `config.raise_errors_for_deprecations!`, and it will turn the
#   deprecation warnings into errors, giving you the full backtrace.
#
#   1 deprecation warning total
#
#   Finished in 0.00127 seconds (files took 0.03325 seconds to load)
#   2 examples, 0 failures
