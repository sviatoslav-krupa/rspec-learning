# Notes:
#   * Mock is a replacement for a real object that allows you to set expectations on how it is used
#   * A double can be used to replace a real object in your tests
#   * A double is strict by default - messages that have not been specifically allowed or expected will trigger an error
#   * The first argument for `double` is a name or identifier for the double, used for reporting in failure messages

# Docs:
#   * https://rspec.info/documentation/3.8/rspec-mocks/RSpec/Mocks/ExampleMethods.html#double-instance_method
#   * https://rspec.info/features/3-12/rspec-mocks/
#   * https://rspec.info/features/3-12/rspec-mocks/configuring-responses/returning-a-value/

describe 'a random double' do
  it 'only allows defined methods to be invoked' do

    # Here, :fall_off_ladder and :light_on_fire are methods with their returned value that we are defining on the double
    stuntman = double("Mr. Danger", fall_off_ladder: 'Ouch', light_on_fire: true)
    expect(stuntman.fall_off_ladder).to eq('Ouch')
    expect(stuntman.light_on_fire).to   eq(true)

    # Alternative syntax
    stuntman = double("Mr. Danger")
    # Here, we are using `allow` to define the behavior of the double
    # Without `and_return`, the method would return nil by default
    allow(stuntman).to receive(:fall_off_ladder).and_return('Ouch')
    expect(stuntman.fall_off_ladder).to eq('Ouch')

    # And another syntax :)
    stuntman = double("Mr. Danger")
    allow(stuntman).to receive_messages(fall_off_ladder: 'Ouch', light_on_fire: true)
    expect(stuntman.fall_off_ladder).to eq('Ouch')
    expect(stuntman.light_on_fire).to   eq(true)
  end
end
# OUTPUT:
#
#   a random double
#     only allows defined methods to be invoked
#
#   Finished in 0.00241 seconds (files took 0.03238 seconds to load)
#   1 example, 0 failures
