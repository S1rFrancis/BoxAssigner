require 'boxes/box_assigner.rb'

# Here is a list of users and the contents they have received already.

users = [
  { name: 'Steve', received_contents: ['1a', '1b', '3c'] },
  { name: 'Virginie', received_contents: ['3a', '2b', '3c'] },
  { name: 'Fiona', received_contents: ['1b', '2a', '3b'] },
  { name: 'Jenny', received_contents: ['3b', '2c', '1b'] },
  { name: 'James', received_contents: ['2b', '1b', '3a'] },
  { name: 'Fede', received_contents: ['2c', '3a', '1c'] },
  { name: 'Sara', received_contents: ['3a', '2c', '3b'] },
  { name: 'Tizi', received_contents: ['2b', '1b', '2a'] },
  { name: 'Thomas', received_contents: ['3c', '2b', '1a'] },
]

# These are the box codes for the next shipment and their contents

box_codes = [
  {code: 'gr1', contents: ['1a', '1b'], type: :petite},
  {code: 'gr2', contents: ['1a', '2b'], type: :petite},
  {code: 'gr3', contents: ['1b', '2c'], type: :petite},
  {code: 'gr4', contents: ['2c', '3c'], type: :petite},
  {code: 'gr5', contents: ['3b', '1c'], type: :petite},
]

# Create a class that that accepts the list of users and returns a a list of
# users and the box codes they can receive without getting the same contents again.

describe BoxAssigner do
  assigner = BoxAssigner.new(box_codes)
  box_list = assigner.assign(users)

  it 'Steve can recieve box: gr5 only' do
    expect(box_list["Steve"]).to eq [box_codes[4]]
  end

  it 'Virginie can recieve boxes: gr1, gr3, gr5 only' do
    expect(box_list["Virginie"]).to eq [box_codes[0], box_codes[2], box_codes[4]]
  end

  it 'Fiona can recieve boxes: gr2, gr4 only' do
    expect(box_list["Fiona"]).to eq [box_codes[1], box_codes[3]]
  end

  it 'Jenny can recieve boxes: gr2  only' do
    expect(box_list["Jenny"]).to eq [box_codes[1]]
  end

  it 'James can recieve boxes: gr4, gr5 only' do
    expect(box_list["James"]).to eq [box_codes[3], box_codes[4]]
  end

  it 'Fede can recieve boxes: gr1, gr2 only' do
    expect(box_list["Fede"]).to eq [box_codes[0], box_codes[1]]
  end

  it 'Sara can recieve boxes: gr1, gr2 only' do
    expect(box_list["Sara"]).to eq [box_codes[0], box_codes[1]]
  end

  it 'Tizi can recieve boxes: gr4, gr5 only' do
    expect(box_list["Tizi"]).to eq [box_codes[3], box_codes[4]]
  end

  it 'Thomas can recieve boxes: gr3, gr5 only' do
    expect(box_list["Thomas"]).to eq [box_codes[2], box_codes[4]]
  end
end
