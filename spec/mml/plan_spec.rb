describe MML::Plan do
  let(:test_ref) {MML::ExtRef.new(href: 'http://testserer/laborder')}
  let(:test_order) {MML::ValueWithLink.new(value: 'Full Blood Count', link: [test_ref])}
  let(:rx_ref) {MML::ExtRef.new(href: 'http://rxorder/injection')}
  let(:rx_order) {MML::ValueWithLink.new(value:'Rp1. Ampicilin 3.0g div', link: [rx_ref])}
  let(:tx_ref) {MML::ExtRef.new(href: 'http://txorder/care')}
  let(:tx_order) {MML::ValueWithLink.new(value: 'cooling', link: [tx_ref])}
  let(:plan) {MML::Plan.new(testOrder: test_order, rxOrder: rx_order, txOrder: tx_order, planNotes: 'Antibiotics administration')}

  it 'is an instance of MML::Plan' do
    expect(plan).to be_an_instance_of MML::Plan
  end

  it 'testOrder should be assigned properly' do
    expect(plan.testOrder.value).to eq 'Full Blood Count'
  end

  it 'testOrder is optional' do
    expect {plan.testOrder = nil}.not_to raise_error
  end

  it 'rxOrder should be assigned properly' do
    expect(plan.rxOrder.value).to eq 'Rp1. Ampicilin 3.0g div'
  end

  it 'rxOrder is optional' do
    expect {plan.rxOrder = nil}.not_to raise_error
  end

  it 'txOrder should be assigned properly' do
    expect(plan.txOrder.value).to eq 'cooling'
  end

  it 'txOrder is optional' do
    expect {plan.txOrder = nil}.not_to raise_error
  end

  it 'planNotes should be assigned properly' do
    expect(plan.planNotes).to eq 'Antibiotics administration'
  end

  it 'planNotes is optional' do
    expect {plan.planNotes = nil}.not_to raise_error
  end
end
