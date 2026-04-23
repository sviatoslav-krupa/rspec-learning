# Notes:
#   * Class double is used to create a test double that is a stand-in for a class
#   * Class double is a type of verifying double
#   * The difference between instance and class doubles is that
#     instance doubles are used to create test doubles for instances of a class,
#     while class doubles are used to create test doubles for the class itself
#   * Class doubles can be used to stub or mock CLASS methods
#   * We can't stub non-existing methods
#   * `as_stubbed_const` is used to replace the class with the double during the test execution

# Docs:
#   * https://rspec.info/features/3-12/rspec-mocks/verifying-doubles/class-doubles/

class Deck
  def self.build
    # Business logic to build a whole bunch of cards
  end
end

class CardGame
  attr_reader :cards

  def start
    @cards = Deck.build
  end
end

describe CardGame do
  it 'can only implement class methods that are defined on a class' do
    deck_klass = class_double(Deck, build: ['Ace', 'Queen']).as_stubbed_const

    # `class_double` alone does not affect `Deck` constant usage in `CardGame#start`.
    # `as_stubbed_const` replaces `Deck` with the double, so `Deck.build` calls are intercepted.
    # Without it, `subject.start` calls the real `Deck.build`, so this expectation would fail.
    expect(deck_klass).to receive(:build)

    subject.start

    # Without `as_stubbed_const` it will raise an error: `Failure/Error: expect(subject.cards).to eq(['Ace', 'Queen']): expected: ["Ace", "Queen"], got: nil`
    # because `Deck` is not a class double, it's a regular class
    expect(subject.cards).to eq(['Ace', 'Queen'])
  end
end
# OUTPUT:
#
#   CardGame
#     can only implement class methods that are defined on a class
#
#   Finished in 0.00391 seconds (files took 0.04698 seconds to load)
#   1 example, 0 failures
