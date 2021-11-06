# frozen_string_literal: true

RSpec.describe Project19 do
  it "has a version number" do
    expect(Project19::VERSION).not_to be nil
  end

  it "has a version 0.1.0" do
    expect(Project19::VERSION).to eq("0.1.0")
  end
end
