# Notes:
#   * Implicit subject means that the subject is created automatically by instantiating the class you are testing
#     or an instance if it's already provided
#   * The implicit subject is created once per example and not shared between examples (as `let` works)
#   * In the example below `subject == let(:subject) { Hash.new }`

# Docs:
#   * https://rspec.info/features/3-12/rspec-core/subject/implicit-subject/
#   * https://stackoverflow.com/questions/38437162/whats-the-difference-between-rspecs-subject-and-let-when-should-they-be-used

describe Hash do
  it 'should start off empty' do
    p subject        #=> {}
    p subject.class  #=> Hash

    expect(subject.length).to eq(0)
    subject[:some_key] = "Some Value"
    expect(subject.length).to eq(1)
  end

  it 'is isolated between examples' do
    expect(subject.length).to eq(0)
  end
end
# OUTPUT:
#
#   Hash
#   {}
#   Hash
#     should start off empty
#     is isolated between examples
#
#   Finished in 0.00057 seconds (files took 0.03185 seconds to load)
#   2 examples, 0 failures

# Edge cases:
describe 'Hash' do
  it 'should test the edge cases' do
    p subject        #=> "Hash"
    p subject.class  #=> String
  end
end
# OUTPUT:
#
#   Hash
#   "Hash"
#   String
#     should test the edge cases
#
#   Finished in 0.00038 seconds (files took 0.03173 seconds to load)
#   1 example, 0 failures

class ClassWithCustomInitializer
  def initialize(name)
    @name = name
  end
end

describe ClassWithCustomInitializer do
  it 'creates an implicit subject' do
    subject
  end
end
# OUTPUT:
#
#   F
# 
#   Failures:
# 
#   1) ClassWithCustomInitializer creates an implicit subject
#     Failure/Error:
#       def initialize(name)
#         @name = name
#       end
#  
#     ArgumentError:
#      wrong number of arguments (given 0, expected 1)
#      # ./spec/03__subjects_shared_examples_and_shared_context/01__implicit_subject_spec.rb:54:in 'ClassWithCustomInitializer#initialize'
#      # ./spec/03__subjects_shared_examples_and_shared_context/01__implicit_subject_spec.rb:61:in 'block (2 levels) in <top (required)>'
# 
#   Finished in 0.00242 seconds (files took 0.03906 seconds to load)
#   1 example, 1 failure
# 
#   Failed examples:
# 
#   rspec ./spec/03__subjects_shared_examples_and_shared_context/01__implicit_subject_spec.rb:60 # ClassWithCustomInitializer creates an implicit subject
