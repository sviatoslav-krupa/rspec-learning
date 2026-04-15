# Docs:
#   * https://rspec.info/features/3-12/rspec-core/subject/one-liner-syntax/

describe 'shorthand syntax' do
  subject { 5 }

  context 'with classic syntax' do
    it 'should equal 5' do
      expect(subject).to eq(5)
    end
  end

  context 'with one-liner syntax' do
    it { is_expected.to eq(5) }
  end

  context 'with mixed syntax' do
    it 'should equal 5' do
      is_expected.to eq(5)
    end

    it do
      expect(subject).to eq(5)
    end
  end
end
# OUTPUT:
#
#   shorthand syntax
#     with classic syntax
#       should equal 5
#     with one-liner syntax
#       is expected to eq 5
#     with mixed syntax
#       should equal 5
#       is expected to eq 5
# 
#   Finished in 0.00088 seconds (files took 0.03991 seconds to load)
#   4 examples, 0 failures
