describe MML::ProblemItem do
  let(:subjective) {MML::Subjective.new(freeNotes: 'headache from 5 years ago')}
  let(:objective) {MML::Objective.new(objectiveNotes: 'looks pale')}
  let(:assessmentItem) {'Acute bronchitis'}
  let(:plan) {MML::Plan.new(planNotes: 'Antibiotics administration')}
  let(:problem_item) {MML::ProblemItem.new(problem: 'headache', dxUid: '0012-3330-abdc', subjective: subjective, objective: objective, assessment: [assessmentItem], plan: plan)}

  it 'problem item is an instance of MML::ProblemItem' do
    expect(problem_item).to be_an_instance_of MML::ProblemItem
  end

  it 'problem should be assigned properly' do
    expect(problem_item.problem).to eq 'headache'
  end

  it 'dxUid should be assigned properly' do
    expect(problem_item.dxUid).to eq '0012-3330-abdc'
  end

  it 'subjective should be assigned properly' do
    expect(problem_item.subjective.freeNotes).to eq 'headache from 5 years ago'
  end

  it 'objective should be assigned properly' do
    expect(problem_item.objective.objectiveNotes).to eq 'looks pale'
  end

  it 'assessment should be assigned properly' do
    expect(problem_item.assessment[0]).to eq 'Acute bronchitis'
  end

  it 'plan should be assigned properly' do
    expect(problem_item.plan.planNotes).to eq 'Antibiotics administration'
  end
end
