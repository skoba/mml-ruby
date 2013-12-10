describe MML::ProblemItem do
  let(:problem_item) {MML::ProblemItem.new(problem: 'headache', dxUid: '0012-3330-abdc')}

  it 'problem item is an instance of MML::ProblemItem' do
    expect(problem_item).to be_an_instance_of MML::ProblemItem
  end

  it 'problem should be assigned properly' do
    expect(problem_item.problem).to eq 'headache'
  end

  it 'dxUid should be assigned properly' do
    expect(problem_item.dxUid).to eq '0012-3330-abdc'
  end
end
