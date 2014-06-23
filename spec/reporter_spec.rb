require 'reporter'

describe Reporter do
  it "can determine a person's inbound commute time for a day and week" do
    input = {
        "Elsa" => [
            {
                week: 1,
                day: "Monday",
                mode: "Drive",
                inbound: 30,
                outbound: 50,
                distance: 24
            },
            {
                week: 1,
                day: "Tuesday",
                mode: "Drive",
                inbound: 35,
                outbound: 52,
                distance: 24
            },
        ]
    }

    reporter = Reporter.new(input)

    expect(reporter.inbound_commute_time("Elsa", 1, "Tuesday")).to eq 35
  end

  it "can determine the averge commute time for all of the data" do
    input = {
        "Elsa" => [
            {
                week: 1,
                day: "Monday",
                mode: "Drive",
                inbound: 10,
                outbound: 20,
                distance: 20
            },
            {
                week: 1,
                day: "Tuesday",
                mode: "Drive",
                inbound: 20,
                outbound: 10,
                distance: 10
            },
        ],
        "Bob" => [
            {
                week: 4,
                day: "Monday",
                mode: "Drive",
                inbound: 10,
                outbound: 20,
                distance: 24
            },
            {
                week: 5,
                day: "Tuesday",
                mode: "Drive",
                inbound: 30,
                outbound: 40,
                distance: 24
            },
        ]
    }

    reporter = Reporter.new(input)

    expected = (10 + 20 + 20 + 10 + 10 + 20 + 30 + 40) / 8

    expect(reporter.average_commute_time).to eq expected
  end

  it 'can calculate fastest walker' do
    input = {
        "Elsa" => [
            {
                week: 1,
                day: "Monday",
                mode: "Walk",
                inbound: 10,
                outbound: 10,
                distance: 20
            },
        ],
        "Bob" => [
            {
                week: 4,
                day: "Monday",
                mode: "Drive",
                inbound: 10,
                outbound: 20,
                distance: 24
            },
        ],
        "Felix" => [
            {
                week: 4,
                day: "Monday",
                mode: "Walk",
                inbound: 5,
                outbound: 5,
                distance: 30
            },
        ],
        "Sue" => [
            {
                week: 4,
                day: "Monday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 24
            },
        ]
    }

    reporter = Reporter.new(input)

    expected = ["Felix", (30/5.0 + 30/5.0) / 2]

    expect(reporter.fastest_walker).to eq expected
  end
end