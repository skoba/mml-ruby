# -*- coding: utf-8 -*-
describe MML::InsuranceClass do
  let(:insurance_class) { MML::InsuranceClass.new(classCode: '01', tableId: 'MML0031', value: '国保') }

  it 'is an instance of MML::InsuranceClass' do
    expect(insurance_class).to be_an_instance_of MML::InsuranceClass
  end

  it 'value should be assigned properly' do
    expect(insurance_class.value).to eq '国保'
  end

  it 'value is mandatory' do
    expect {insurance_class.value = nil}.to raise_error ArgumentError
  end

  it 'classCode should be assigned properly' do
    expect(insurance_class.classCode).to eq '01'
  end

  it 'tableId should be assigned properly' do
    expect(insurance_class.tableId).to eq 'MML0031'
  end
end
