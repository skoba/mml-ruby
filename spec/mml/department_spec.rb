describe MML::Department do
  let(:id) { MML::Id.new(value: '16', type: 'medical', tableId: 'MML0029') }
  let(:name) { MML::DepartmentName.new(value: 'Cardiovascular Surgery', repCode: 'A', tableId: 'MML0025') }
  let(:department) { MML::Department.new(id: id, name: [name]) }

  it 'is an instance of MML::Department' do
    expect(department).to be_an_instance_of MML::Department
  end

  context 'name' do
    let(:department_name) { department.name[0] }

    it 'name should assigned properly' do
      expect(department_name.value).to eq 'Cardiovascular Surgery'
    end

    it 'name shold not be nil' do
      expect {department.name = nil}.to raise_error ArgumentError
    end

    it 'name should not be empty' do
      expect {department.name = []}.to raise_error ArgumentError
    end
  end

  it 'id should be properyl assigned' do
    expect(department.id.value).to eq '16'
  end

  it 'id is not mandatory' do
    expect { department.id = nil}.not_to raise_error
  end

  context "#to_xml" do
    subject { department.to_xml }

    it {should match '<mmlDp:Department>'}
    it {should match '<mmlDp:name'}
    it {should match 'mmlDp:repCode="A"'}
    it {should match 'mmlDp:tableId="MML0025"'}
    it {should match '>Cardiovascular Surgery</mmlDp:name>'}
    it {should match '<mmlCm:Id'}
    it {should match 'mmlCm:type="medical"'}
    it {should match 'mmlCm:tableId="MML0029"'}
    it {should match '>16</mmlCm:Id>'}
    it {should match '</mmlDp:Department>'}
  end
end
