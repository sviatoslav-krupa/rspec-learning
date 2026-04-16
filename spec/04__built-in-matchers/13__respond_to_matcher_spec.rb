# Docs:
#   * https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/respond-to/

class HotChocolate
  def drink
    'Delicious'
  end

  def discard
    'PLOP!'
  end

  def purchase(number)
    "Awesome, I just purchased #{number} more hot chocolate beverages!"
  end
end

describe HotChocolate do
  it 'confirms that an object can respond to a method' do
    expect(subject).to respond_to(:drink)
    expect(subject).to respond_to(:drink, :discard)
    expect(subject).to respond_to(:drink, :discard, :purchase)
  end

  it 'confirms an object can respond to a method with arguments' do
    expect(subject).to respond_to(:purchase)
    expect(subject).to respond_to(:purchase).with(1).argument
  end

  it { is_expected.to respond_to(:purchase, :discard) }
  it { is_expected.to respond_to(:purchase).with(1).arguments }
end
# OUTPUT:
#
#   HotChocolate
#     confirms that an object can respond to a method
#     confirms an object can respond to a method with arguments
#     is expected to respond to [:purchase, :discard]
#     is expected to respond to #purchase with 1 argument
#
#   Finished in 0.00095 seconds (files took 0.03262 seconds to load)
#   4 examples, 0 failures
