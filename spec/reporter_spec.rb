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
end