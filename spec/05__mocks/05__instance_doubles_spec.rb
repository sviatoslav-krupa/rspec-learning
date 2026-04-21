# Notes:
#   * Instance double is used to create a test double that is a stand-in for an instance of a class
#   * Instance double is a type of verifying double
#   * The difference between general double and instance double is that
#     the instance double only allows methods that are defined on the class to be called
#   * Instance doubles can be used to stub or mock INSTANCE methods
#   * We can't stub non-existing methods
#   * Instance double also keeps tracking the number of arguments passed to the stubbed method

# Docs:
#   * https://rspec.info/features/3-12/rspec-mocks/verifying-doubles/instance-doubles/
#   * https://semaphore.io/community/tutorials/introduction-to-verifying-doubles-in-rspec

class Person
  def a(seconds)
    sleep(seconds)
    "Hello"
  end
end

describe Person do
  describe 'regular double' do
    it 'can implement any method' do
      person = double(a: "Hello", b: 20)
      expect(person.a).to eq("Hello")
    end
  end

  describe 'instance double' do
    it 'can only implement methods that are defined on the class' do
      # `person = instance_double(Person, a: 'Hello', b: 20)` raises an error cause `b` is not defined on `Person`
      person = instance_double(Person)
      allow(person).to receive(:a).with(3).and_return("Hello")

      # This also raises an error cause `b` is not defined on `Person`
      # allow(person).to receive(:b).and_return("This will cause an error")

      expect(person.a(3)).to eq("Hello")
    end
  end
end
# OUTPUT:
#
#   Person
#     regular double
#       can implement any method
#     instance double
#       can only implement methods that are defined on the class
#
#   Finished in 0.00389 seconds (files took 0.04768 seconds to load)
#   2 examples, 0 failures
