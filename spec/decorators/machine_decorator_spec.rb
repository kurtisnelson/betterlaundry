require 'spec_helper'

describe MachineDecorator do
  let(:machine) { FactoryGirl.build(:machine) }
  subject{MachineDecorator.decorate(machine)}

  it 'calculates a status bar' do
    subject.percent.should be_within(0.75).of(66)
  end
end
