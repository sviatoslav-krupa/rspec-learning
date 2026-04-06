# Notes:
#   * The `let` method is a way to define a memoized helper method in RSpec
#   * It memoizes the value in scope of the example, not in the example group!!!
#   * Memoization means that the value is cached after the first call
#   * The `let` method is lazy-loaded, meaning it won't be executed until it's called
#   * The `let!` (with bang `!`) method is similar to `let`, but it is executed immediately even if it's not called; it's an alternative for `before`
#   * We can use `let` inside other `let` methods

class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

describe Card do
  let(:card) { Card.new('Ace', 'Spades') }

  it 'has a rank and that rank can change' do
    # The brand-new object
    expect(card.rank).to eq('Ace')

    # The same object
    card.rank = 'Queen'

    # The same object
    expect(card.rank).to eq('Queen')
  end

  it 'has a suit' do
    # The brand-new object
    expect(card.suit).to eq('Spades')
  end
end
# OUTPUT:
#
#   Card
#     has a rank and that rank can change
#     has a suit
#
#   Finished in 0.00084 seconds (files took 0.04572 seconds to load)
#   2 examples, 0 failures
