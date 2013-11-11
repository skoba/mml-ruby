describe MML::Base do
  let(:mml){MML::Base.new}

  it 'should be an instance of MML::Base' do
    expect(mml).to be_an_instance_of MML::Base
  end

  it 'namespace should be xmlns:mml="http://www.medxml.net/MML"' do
    expect(mml.namespace).to eq 'xmlns:mml="http://www.medxml.net/MML"'
  end
end
