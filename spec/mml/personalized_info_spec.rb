describe MML::PersonalizedInfo do
  let(:personalized_info) { MML::PersonalizedInfo.new }

  it 'personalized info should be an instance of PersonalizedInfo' do
    expect(personalized_info).to be_an_instance_of MML::PersonalizedInfo
  end
end
