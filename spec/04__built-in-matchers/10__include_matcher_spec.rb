# Notes:
#   * `include` checks for substring inclusion, array inclusion, or hash key or key-value pair inclusion

describe 'include matcher' do
  describe 'hot chocolate' do
    it 'checks for substring inclusion' do
      expect(subject).to include('hot')
      expect(subject).to include('choc')
      expect(subject).to include('late')
      expect(subject).to include('hot', 'choc', 'late')
    end

    it { is_expected.to include('choc') }
  end

  describe [10, 20, 30] do
    it 'checks for inclusion in the array, regardless of order' do
      expect(subject).to include(10)
      expect(subject).to include(10, 20)
      expect(subject).to include(30, 20)
      expect(subject).to include(30, 20, 20, 10, 10)
    end

    it { is_expected.to include(20, 30, 10) }
    it { is_expected.not_to include([10, 20, 30]) }
  end

  describe({ a: 2, b: 4 }) do
    it 'can check for key existence' do
      expect(subject).to include(:a)
      expect(subject).to include(:a, :b)
      expect(subject).to include(:b, :a)
      expect(subject).to include(:a, :a, :b, :b)
    end

    it 'can check for key-value pair' do
      expect(subject).to include(a: 2)
    end

    it { is_expected.to include(:b) }
    it { is_expected.to include(b: 4) }
    it { is_expected.to include(a: 2, b: 4, b: 4) }
  end
end
# OUTPUT:
#
#   include matcher
#     hot chocolate
#       checks for substring inclusion
#       is expected to include "choc"
#     [10, 20, 30]
#       checks for inclusion in the array, regardless of order
#       is expected to include 20, 30, and 10
#     {a: 2, b: 4}
#       can check for key existence
#       can check for key-value pair
#       is expected to include :b
#       is expected to include {b: 4}
#
#   Finished in 0.00315 seconds (files took 0.03225 seconds to load)
#   8 examples, 0 failures
