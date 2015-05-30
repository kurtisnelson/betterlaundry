require 'rails_helper'

describe MachineDecorator do
  let(:machine) { FactoryGirl.build(:machine) }
  subject{MachineDecorator.decorate(machine)}

  it 'calculates a status bar' do
    expect(subject.percent).to be_within(0.75).of(66)
  end
end
