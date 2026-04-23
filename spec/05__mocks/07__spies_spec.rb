# Notes:
#   * Spies are a type of test double that allow you to verify that a method was called on an object
#   * Spies place the expectation after the action, when double places the expectation before the action
#   * Spies automatically track methods that have been called on them

# Docs:
#   * https://martinfowler.com/articles/mocksArentStubs.html
#   * https://thoughtbot.com/blog/a-closer-look-at-test-spies#what39s-next

describe 'spies' do
  let(:animal) { spy('animal') }

  it 'confirms that a message has been received' do
    # `spy` is a null-object double: it accepts unknown methods and records calls
    # spy('animal') == double('animal').as_null_object
    animal.eat_food
    expect(animal).to     have_received(:eat_food)
    expect(animal).not_to have_received(:eat_human)
  end

  it 'resets between examples' do
    expect(animal).not_to have_received(:eat_food)
  end

  it 'retains the same functionality of a regular double' do
    animal.eat_food
    animal.eat_food
    animal.eat_food('Sushi')

    # Each `have_received` expectation checks the same recorded call history independently
    expect(animal).to have_received(:eat_food).exactly(3).times
    expect(animal).to have_received(:eat_food).at_least(2).times
    expect(animal).to have_received(:eat_food).with('Sushi')
    expect(animal).to have_received(:eat_food).once.with('Sushi')
  end
end
# OUTPUT:
#
#   spies
#     confirms that a message has been received
#     resets between examples
#     retains the same functionality of a regular double
#
#   Finished in 0.00133 seconds (files took 0.04694 seconds to load)
#   3 examples, 0 failures

class Car
  def initialize(model)
    @model = model
  end
end

class Garage
  attr_reader :storage

  def initialize
    @storage = []
  end

  def add_to_collection(model)
    @storage << Car.new(model)
  end
end

describe Garage do
  let(:car) { instance_double(Car) }

  before do
    # Stubbing `Car.new` with `allow(...).to receive(...)` also tracks calls,
    # so `Car` can be verified with `have_received` without an explicit `spy`.
    allow(Car).to receive(:new).and_return(car)
  end

  it 'adds a car to its storage' do
    subject.add_to_collection('Honda Civic')
    expect(Car).to have_received(:new).with('Honda Civic')
    expect(subject.storage.length).to eq(1)
    expect(subject.storage.first).to  eq(car)
  end
end
# OUTPUT:
#
#   Garage
#     adds a car to its storage
#
#   Finished in 0.0036 seconds (files took 0.03231 seconds to load)
#   1 example, 0 failures
