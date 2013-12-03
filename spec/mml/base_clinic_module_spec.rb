describe MML::BaseClinic do
  let(:base_clinic) {MML::BaseClinic.new}

  it 'is an instance of MML::BaseClinic' do
    expect(base_clinic).to be_an_instance_of MML::BaseClinic
  end
end
