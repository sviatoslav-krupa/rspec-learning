# Notes:
#   * `a.equal?(b)` (object identity: a and b refer to the same object)
#   * `a.eql?(b)`   (object equivalence: a and b have the same value AND type)
#   * `a == b`      (object equivalence: a and b have the same value; less strict than `eql?`)
#
#   * `expect(a).to equal(b)` or `expect(a).to be(b)` (passes if `a.equal?(b)`)
#   * `expect(a).to eql(b)`                           (passes if `a.eql?(b)`)
#   * `expect(a).to eq(b)` or `expect(a).to be == b`  (passes if `a == b`)

# Docs:
#   * https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/equality/

describe 'equality matchers' do
  let(:a) { 3.0 }
  let(:b) { 3 }

  describe 'eq matcher' do
    it 'tests for value and ignores type' do
      expect(a).to eq(b)
    end
  end

  describe 'eql matcher' do
    it 'tests for value, including same type' do
      expect(a).not_to eql(b)
    end
  end

  describe 'equal and be matcher' do
    let(:c) { [1, 2, 3] }
    let(:d) { [1, 2, 3] }
    let(:e) { c }

    it 'cares about object identity' do
      expect(c).not_to  equal(d)
      expect(c).not_to  equal([1, 2, 3])
      expect(c).to      equal(e)
      expect(c).to      be(e)

      expect(c).to eql(d)

      expect(c).to eq(d)
    end
  end
end
# OUTPUT:
#
#   equality matchers
#     eq matcher
#       tests for value and ignores type
#     eql matcher
#       tests for value, including same type
#     equal and be matcher
#       cares about object identity
#
#   Finished in 0.00181 seconds (files took 0.04941 seconds to load)
#   3 examples, 0 failures
