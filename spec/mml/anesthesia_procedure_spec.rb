describe MML::AnesthesiaProcedure do
  let(:anesthesia_procedure){MML::AnesthesiaProcedure.new(title: 'general anesthesia', code: 'L002', system: 'MHLW')}

  it 'is an instance of MML::Anesthesia' do
    expect(anesthesia_procedure).to be_an_instance_of MML::AnesthesiaProcedure
  end

  it 'title should be assigned properly' do
    expect(anesthesia_procedure.title).to eq 'general anesthesia'
  end

  it 'code should be assigned properly' do
    expect {anesthesia_procedure.title = nil}.to raise_error ArgumentError
  end
end
