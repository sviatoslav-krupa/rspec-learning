class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

describe Card do
  let(:card) { Card.new('Ace', 'Spades') }

  it 'has a custom error message' do
    card.suit = 'Nonsense'
    comparison = 'Spades'

    # Here, we added a custom message in case of a failure
    # expect(card.suit).to(eq(comparison), "Hey, I expected #{comparison} but I got #{card.suit} instead!")
    expect(card.suit).to eq(comparison), "Hey, I expected #{comparison} but I got #{card.suit} instead!"
  end
end
# OUTPUT:
#   F
#
#   Failures:
#
#     1) Card has a custom error message
#       Failure/Error: expect(card.suit).to eq(comparison), "Hey, I expected #{comparison} but I got #{card.suit} instead!"
#         Hey, I expected Spades but I got Nonsense instead!
#       # ./spec/02__basics/09__custom_error_message_spec.rb:26:in 'block (2 levels) in <top (required)>'
#
#   Finished in 0.0073 seconds (files took 0.04274 seconds to load)
#   1 example, 1 failure
#
#   Failed examples:
#
#   rspec ./spec/02__basics/09__custom_error_message_spec.rb:13 # Card has a custom error message
