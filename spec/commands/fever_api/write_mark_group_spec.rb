# frozen_string_literal: true

require "spec_helper"

describe FeverAPI::WriteMarkGroup do
  subject { described_class.new(marker_class:) }

  let(:group_marker) { double("group marker") }
  let(:marker_class) { double("marker class") }

  it "instantiates a group marker and calls mark_group_as_read if requested" do
    expect(marker_class)
      .to receive(:new).with(5, 1_234_567_890).and_return(group_marker)
    expect(group_marker).to receive(:mark_group_as_read)
    expect(subject.call(mark: "group", id: 5, before: 1_234_567_890)).to eq({})
  end

  it "returns an empty hash otherwise" do
    expect(subject.call).to eq({})
  end
end