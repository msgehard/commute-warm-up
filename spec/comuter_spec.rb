require 'commuter'

describe Commuter do
  it 'can group the csv rows by person sorted by week and day of week' do
    input = [
        ["Nate", 1, "Tuesday", "Bus", 100, 110, 40],
        ["Jenny", 2, "Friday", "Bike", 14, 11, 2.5],
        ["Jenny", 2, "Tuesday", "Walk", 20, 20, 0.9],
        ["Jenny", 2, "Monday", "Drive", 20, 20, 0.9]
    ]

    expected = {
        "Nate" => [
            {
                week: 1,
                day: "Tuesday",
                mode: "Bus",
                inbound: 100,
                outbound: 110,
                distance: 40
            },
        ],
        "Jenny" => [
            {
                week: 2,
                day: "Monday",
                mode: "Drive",
                inbound: 20,
                outbound: 20,
                distance: 0.9
            },
            {
                week: 2,
                day: "Tuesday",
                mode: "Walk",
                inbound: 20,
                outbound: 20,
                distance: 0.9
            },
            {
                week: 2,
                day: "Friday",
                mode: "Bike",
                inbound: 14,
                outbound: 11,
                distance: 2.5
            },
        ]
    }

    commuter = Commuter.new

    expect(commuter.group_by_name(input)).to eq expected
  end
end