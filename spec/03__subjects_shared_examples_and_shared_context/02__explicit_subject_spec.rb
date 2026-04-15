# Notes:
#   * Explicit subject means that the subject is created explicitly by using `subject` method
#   * We can provide a name for the subject, which we can use in the example
#   * The explicit subject is created once per example and not shared between examples (as implicit subject and `let` works)

# Docs:
#   * https://rspec.info/features/3-12/rspec-core/subject/explicit-subject/

describe Hash do
  subject(:bob) do
    { a: 1, b: 2 }
  end

  it 'has two key-value pairs' do
    expect(subject.length).to eq(2)
    expect(bob.length).to     eq(2)

    subject[:c] = 3
    bob[:d] = 4

    expect(subject.length).to eq(4)
    expect(bob.length).to     eq(4)
  end

  describe 'nested example' do
    it 'has two key-value pairs' do
      expect(subject.length).to eq(2)
      expect(bob.length).to     eq(2)
    end
  end
end
# OUTPUT:
#
#   Hash
#     has two key-value pairs
#     nexted example
#       has two key-value pairs
#
#   Finished in 0.00061 seconds (files took 0.0338 seconds to load)
#   2 examples, 0 failures

# Edge cases:
describe 'Many explicit subjects' do
  subject { { a: 1, b: 2 } }
  subject { { c: 3, d: 4 } }

  it 'overwrites the subject' do
    p subject #=> {c: 3, d: 4}
  end
end
# OUTPUT:
#
#   {c: 3, d: 4}
#   .
# 
#   Finished in 0.00164 seconds (files took 0.04422 seconds to load)
#   1 example, 0 failures

describe 'Explicit and named subjects' do
  subject { { a: 1, b: 2 } }
  subject(:bob) { { c: 3, d: 4 } }

  it 'last one wins' do
    p subject #=> {c: 3, d: 4}
  end
end
# OUTPUT:
#
#   {c: 3, d: 4}
#   .
# 
#   Finished in 0.00164 seconds (files took 0.04422 seconds to load)
#   1 example, 0 failures
