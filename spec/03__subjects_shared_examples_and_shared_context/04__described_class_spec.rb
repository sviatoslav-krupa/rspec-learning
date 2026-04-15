# Notes:
#   * `described_class` is a special method that returns the class being described in the current context

class Prince
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

describe Prince do
  subject { described_class.new('Boris') }
  let(:louis) { described_class.new('Louis') }

  it 'represents a great person' do
    expect(subject.name).to eq('Boris')
    expect(louis.name).to   eq('Louis')
  end
end
# OUTPUT:
#
#   Prince
#     represents a great person
#
#   Finished in 0.00055 seconds (files took 0.03302 seconds to load)
#   1 example, 0 failures

# Edge cases:
describe 'described_class' do
  it 'returns the class being described' do
    p described_class #=> nil
  end
end
# OUTPUT:
#
#   described_class
#     returns the class being described
# 
#   Finished in 0.0018 seconds (files took 0.03892 seconds to load)
#   1 example, 0 failures
