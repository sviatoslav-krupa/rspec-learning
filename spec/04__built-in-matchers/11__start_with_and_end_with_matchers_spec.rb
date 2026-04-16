# Docs:
#   * `start_with`:
#     * https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/start-with/
#   * `end_with`:
#     * https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/end-with/

describe 'start_with and end_with matchers' do
  describe 'caterpillar' do
    it 'should check for substring at the beginning or end' do
      expect(subject).to start_with('cat')
      expect(subject).to end_with('pillar')
    end

    it { is_expected.to start_with('cat') }
    it { is_expected.to end_with('pillar') }
  end

  describe [:a, :b, :c, :d] do
    it 'should check for elements at beginning or end of the array' do
      expect(subject).to start_with(:a)
      expect(subject).to start_with(:a, :b)
      expect(subject).to start_with(:a, :b, :c)
      expect(subject).to start_with(:a, :b, :c, :d)
      expect(subject).to end_with(:d)
      expect(subject).to end_with(:c, :d)
      expect(subject).to end_with(:b, :c, :d)
      expect(subject).to end_with(:a, :b, :c, :d)
    end

    it { is_expected.to start_with(:a, :b) }
    it { is_expected.to end_with(:c, :d) }
  end

end
# OUTPUT:
#
#   start_with and end_with matchers
#     caterpillar
#       should check for substring at the beginning or end
#       is expected to start with "cat"
#       is expected to end with "pillar"
#     [:a, :b, :c, :d]
#       should check for elements at beginning or end of the array
#       is expected to start with :a and :b
#
#   Finished in 0.00124 seconds (files took 0.04556 seconds to load)
#   5 examples, 0 failures
