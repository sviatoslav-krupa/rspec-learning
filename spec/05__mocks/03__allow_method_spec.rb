# Docs:
#   * https://rspec.info/features/3-12/rspec-mocks/basics/allowing-messages/

describe 'allow method review' do
  it 'can customize return value for methods on doubles' do
    calculator = double

    allow(calculator).to receive(:add).and_return(15)

    expect(calculator.add).to              eq(15)
    expect(calculator.add(3)).to           eq(15)
    expect(calculator.add(-2, -3, -5)).to  eq(15)
    expect(calculator.add('hello')).to     eq(15)
  end

  it 'can stub one or more methods on a real object' do
    arr = [1, 2, 3]

    allow(arr).to receive(:sum).and_return(10)

    expect(arr.sum).to eq(10)

    arr.push(4)

    expect(arr).to     eq([1, 2, 3, 4])
    expect(arr.sum).to eq(10)
  end

  it 'can return multiple return values in sequence' do
    mock_array = double

    allow(mock_array).to receive(:pop).and_return(:c, :b, :a)

    expect(mock_array.pop).to eq(:c)
    expect(mock_array.pop).to eq(:b)
    expect(mock_array.pop).to eq(:a)
    expect(mock_array.pop).to eq(:a) # returns last value repeatedly
    expect(mock_array.pop).to eq(:a)
    expect(mock_array.pop).to eq(:a)
  end
end
# OUTPUT:
#
#   allow method review
#     can customize return value for methods on doubles
#     can stub one or more methods on a real object
#     can return multiple return values in sequence
#
#   Finished in 0.00432 seconds (files took 0.04738 seconds to load)
#   3 examples, 0 failures
