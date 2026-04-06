# Notes:
#   * `expect` is used to set an expectation
#   * `eq` is a matcher that checks for equality
#   * `it` can have multiple expectations

class Card
  attr_reader :type

  def initialize(type)
    @type = type
  end
end

describe 'Card' do
  it 'has a type' do
    card = Card.new('Ace of Spades')
    expect(card.type).to(eq('Ace of Spades'))
  end
end
# OUTPUT (without Card class defined):
#   F
#
#   Failures:
#
#     1) Card has a type
#       Failure/Error: card = Card.new('Ace of Spades')
#
#       NameError:
#         uninitialized constant Card
#       # ./spec/02__basics/03__expect_and_eq_spec.rb:3:in 'block (2 levels) in <top (required)>'
#
#   Finished in 0.00223 seconds (files took 0.04734 seconds to load)
#   1 example, 1 failure
#
#   Failed examples:
#
#   rspec ./spec/02__basics/03__expect_and_eq_spec.rb:2 # Card has a type

# OUTPUT (with Card class defined):
#
#   Card
#     has a type
#
#   Finished in 0.00053 seconds (files took 0.03169 seconds to load)
#   1 example, 0 failures
