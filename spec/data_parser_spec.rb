require 'data_parser'

describe DataParser do
  it 'can translate a row into the hash' do
    input = [
        ["Elsa", 2, "Wednesday", "Drive", 30, 50, 24],
        ["Bob", 2, "Wednesday", "Drive", 30, 50, 24],
    ]

    expected = {
        "Bob" => [
            {
                week: 2,
                day: "Wednesday",
                mode: "Drive",
                inbound: 30,
                outbound: 50,
                distance: 24
            },
        ],
        "Elsa" => [
            {
                week: 2,
                day: "Wednesday",
                mode: "Drive",
                inbound: 30,
                outbound: 50,
                distance: 24
            },
        ]
    }

    expect(DataParser.new.parse(input)).to eq expected
  end

  it 'can sort rows per person' do
    input = [
        ["Elsa", 2, "Wednesday", "Drive", 30, 50, 24],
        ["Elsa", 1, "Wednesday", "Bike", 10, 20, 14],
        ["Elsa", 1, "Tuesday", "Bike", 10, 20, 14],
        ["Elsa", 1, "Monday", "Bike", 10, 20, 14],
        ["Elsa", 1, "Friday", "Bike", 10, 20, 14],
        ["Elsa", 1, "Thursday", "Bike", 10, 20, 14],
    ]

    expected = {
        "Elsa" => [
            {
                week: 1,
                day: "Monday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 14
            },
            {
                week: 1,
                day: "Tuesday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 14
            },
            {
                week: 1,
                day: "Wednesday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 14
            },
            {
                week: 1,
                day: "Thursday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 14
            },
            {
                week: 1,
                day: "Friday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 14
            },
            {
                week: 2,
                day: "Wednesday",
                mode: "Drive",
                inbound: 30,
                outbound: 50,
                distance: 24
            },
        ]
    }

    expect(DataParser.new.parse(input)).to eq expected
  end
end