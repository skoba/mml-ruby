describe MML::Name do
  let(:name) {MML::Name.new}

  it 'name should be an instance of MML::Name' do
    expect(name).to be_an_instance_of MML::Name
  end
end
