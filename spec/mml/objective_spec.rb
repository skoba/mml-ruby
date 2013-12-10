describe MML::Objective do
  let(:objective) {MML::Objective.new(objectiveNotes: 'looks pale')}

  it 'is an instance of MML::Objective' do
    expect(objective).to be_an_instance_of MML::Objective
  end

  it 'objectiveNotes should be assigned properly' do
    expect(objective.objectiveNotes).to eq 'looks pale'
  end
end
