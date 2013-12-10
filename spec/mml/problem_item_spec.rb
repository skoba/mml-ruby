describe MML::ProblemItem do
  let(:problem_item) {MML::ProblemItem.new(problem: 'headache')}

  it 'problem item is an instance of MML::ProblemItem' do
    expect(problem_item).to be_an_instance_of MML::ProblemItem
  end

  it 'problem should be assigned properly' do
    expect(problem_item.problem).to eq 'headache'
  end
end
