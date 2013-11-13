describe MML::Id do
  let(:id) { MML::Id.new(value: '12345', type: 'facility', tableId: 'MML0024', checkDigit: 5, checkDigitSchema: 'MML0001') }

  it 'should be an instance of MML::Id' do
    expect(id).to be_an_instance_of MML::Id
  end

  it 'value should be 12345' do
    expect(id.value).to eq '12345'
  end

  it 'value is mandatory' do
    expect { id.value = nil }.to raise_error ArgumentError
  end

  it 'type should be facility' do
    expect(id.type).to eq 'facility'
  end

  it 'type is mandatory' do
    expect { id.type = nil }.to raise_error ArgumentError
  end

  it 'tableId should be MML0024' do
    expect(id.tableId).to eq 'MML0024'
  end

  it 'tableId is required' do
    expect{id.tableId = nil}.to raise_error ArgumentError
  end

  it 'check digit is 5' do
    expect(id.checkDigit).to be 5
  end

  it 'check digit schema is MML0001' do
    expect(id.checkDigitSchema).to eq 'MML0001'
  end

  context '#to_xml' do
    it 'assigned type attribute matches facility' do
      expect(id.to_xml).to match 'mmlCm:type="facility"'
    end

    it 'assigned tableId matches MML0024' do
      expect(id.to_xml).to match 'mmlCm:tableId="MML0024"'
    end

    it 'assigned check digit matches 5' do
      expect(id.to_xml).to match 'mmlCm:checkDigit="5"'
    end

    it 'assigned check digit schema matches MML0001' do
      expect(id.to_xml).to match 'mmlCm:checkDigitSchema="MML0001"'
    end

    it 'assigned value match 1234' do
      expect(id.to_xml).to match '>12345</mmlCm:Id>'
    end
  end
end
