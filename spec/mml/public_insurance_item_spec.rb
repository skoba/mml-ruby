# -*- coding: utf-8 -*-
describe MML::PublicInsuranceItem do
  let(:public_insurance_item) {MML::PublicInsuranceItem.new(priority: '1', providerName: '公費', provider: '15450034', recipient: '0009043', startDate: '1997-09-30', expiredDate: '1999-09-30', paymentRatio: 10_000, ratioType: 'fix')}

  it 'should be an instance of PublicInsurance' do
    expect(public_insurance_item).to be_an_instance_of MML::PublicInsuranceItem
  end

  it 'priority should be assigned properly' do
    expect(public_insurance_item.priority).to eq '1'
  end

  it 'prioriti is mandatory' do
    expect{public_insurance_item.priority=nil}.to raise_error ArgumentError
  end

  it 'providerName should be assigned properly' do
    expect(public_insurance_item.providerName).to eq '公費'
  end

  it 'providerName is optional' do
    expect{public_insurance_item.providerName = nil}.not_to raise_error
  end

  it 'provider should be assigned properly' do
    expect(public_insurance_item.provider).to eq '15450034'
  end

  it 'provider is mandatory' do
    expect{public_insurance_item.provider = nil}.to raise_error ArgumentError
  end

  it 'recipient should be assigned properly' do
    expect(public_insurance_item.recipient).to eq '0009043'
  end

  it 'recipient is mandatory' do
    expect{public_insurance_item.recipient = nil}.to raise_error ArgumentError
  end

  it 'startDate should be assigned properly' do
    expect(public_insurance_item.startDate).to eq '1997-09-30'
  end

  it 'startDate is mandatory' do
    expect{public_insurance_item.startDate = nil}.to raise_error ArgumentError
  end

  it 'expiredDate should be assigned properly' do
    expect(public_insurance_item.expiredDate).to eq '1999-09-30'
  end

  it 'expiredDate is mandatory' do
    expect{public_insurance_item.expiredDate=nil}.to raise_error ArgumentError
  end

  it 'paymentRatio should be assigned properly' do
    expect(public_insurance_item.paymentRatio).to eq 10_000
  end

  it 'ratioType should be assigned properly' do
    expect(public_insurance_item.ratioType).to eq 'fix'
  end
end
