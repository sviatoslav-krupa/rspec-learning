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
    expect { subject.pop }.to change { subject.length }.by(-1)
    expect { subject.pop }.to change(subject, :length).by(-1)
  end
end
# OUTPUT:
#
#   change matcher
#     checks that a method changes object state
#     accepts negative arguments
#
#   Finished in 0.00127 seconds (files took 0.03325 seconds to load)
#   2 examples, 0 failures
