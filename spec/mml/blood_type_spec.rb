describe MML::BloodType do
  let(:blood_type) {MML::BloodType.new(abo: 'a', rh: 'rhD+')}

  it 'is an instance of MML::BloodType' do
    expect(blood_type).to be_an_instance_of MML::BloodType
  end

  it 'ABO type should be assigned properly' do
    expect(blood_type.abo).to eq 'a'
  end

  it 'ABO type is mandatory' do
    expect{blood_type.abo = nil}.to raise_error ArgumentError
  end

  it 'Rh type indicates D' do
    expect(blood_type.rh).to eq 'rhD+'
  end
end
