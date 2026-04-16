# Notes:
#   * We can combine multiple matchers using `and` and `or`

# Docs:
#   * https://rspec.info/features/3-12/rspec-expectations/compound-expectations/
#   * https://makandracards.com/makandra/58102-rspec-3-allows-chaining-multiple-expectations

describe 25 do
  it 'can test for multiple matchers' do
    expect(subject).to be_odd
    expect(subject).to be > 20

    expect(subject).to be_odd.and be > 20
  end
end

describe 'caterpillar' do
  it 'supports multiple matchers' do
    expect(subject).to start_with('cat') and end_with('pillar')
  end

  it { is_expected.to start_with('cat') and end_with('pillar') }
end

describe [:usa, :canada, :mexico] do
  it 'can check for several possibilities' do
    expect(subject.sample).to eq(:usa).or eq(:canada).or eq(:mexico)
  end
end
# OUTPUT:
#
#   25
#     can test for multiple matchers
#
#   caterpillar
#     supports multiple matchers
#     is expected to start with "cat" and end with "pillar"
#
#   [:usa, :canada, :mexico]
#     can check for several possibilities
#
#   Finished in 0.0032 seconds (files took 0.03162 seconds to load)
#   4 examples, 0 failures
