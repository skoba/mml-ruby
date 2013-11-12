describe MML::Name do
  let(:name) {MML::Name.new(repCode: 'A', tableId: 'MML0025', family: 'KOBAYASHI', given: 'Shinji', middle: 'middle', fullname: 'KOBAYASHI, Shinji', prefix: 'Dr', degree: 'MD, PhD')}

  it 'name should be an instance of MML::Name' do
    expect(name).to be_an_instance_of MML::Name
  end

  it 'repCode should be A' do
    expect(name.repCode).to eq 'A'
  end

  it 'tableId should be MML0025' do
    expect(name.tableId).to eq 'MML0025'
  end

  it 'repCode is mandatory' do
    expect{name.repCode = nil}.to raise_error
  end

  it 'family name is KOBAYASHI' do
    expect(name.family).to eq 'KOBAYASHI'
  end

  it 'given name is Shinji' do
    expect(name.given).to eq 'Shinji'
  end

  it 'middle name is middle' do
    expect(name.middle).to eq 'middle'
  end

  it 'full name is KOBAYASHI, Shinji' do
    expect(name.fullname).to eq 'KOBAYASHI, Shinji'
  end

  it 'prefix should be Dr' do
    expect(name.prefix).to eq 'Dr'
  end

  it 'degree is MD, PhD' do
    expect(name.degree).to eq 'MD, PhD'
  end

  context '#to_xml' do
    let(:xml) { name.to_xml }
    
    it 'mmlNm:given tag matches Shinji' do
      expect(xml).to match '<mmlNm:given>Shinji</mmlNm:given>'
    end

    it 'mmlNm:family tag matches KOBAYASHI' do
      expect(xml).to match '<mmlNm:family>KOBAYASHI</mmlNm:family>'
    end

    it 'mmlNm:fullname tag matches KOBAYASHI, Shinji' do
      expect(xml).to match '<mmlNm:fullname>KOBAYASHI, Shinji</mmlNm:fullname>'
    end

    it 'mmlNm:prefix tag matches Dr' do
      expect(xml).to match '<mmlNm:prefix>Dr</mmlNm:prefix>'
    end

    it 'mmlNm:degree tag matches MD, PhD' do
      expect(xml).to match '<mmlNm:degree>MD, PhD</mmlNm:degree>'
    end
  end
end
