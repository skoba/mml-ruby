describe MML::ValueWithLink do
  let(:value_with_link) {MML::ValueWithLink.new(value: 'GitHub', link: 'https://github.com/')}

  it 'is an instance of MML::ValueWithLink' do
    expect(value_with_link).to be_an_instance_of MML::ValueWithLink
  end

  it 'value should be assigned properly' do
    expect(value_with_link.value).to eq 'GitHub'
  end

  it 'link should be assigned properly' do
    expect(value_with_link.link).to eq 'https://github.com/'
  end
end
