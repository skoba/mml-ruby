describe MML::SurgicalItem do
  let(:surgical_department_name) {MML::DepartmentName.new(repCode: 'A', tableId: 'MML0025', value: 'Cardiovascular surgery')}
  let(:surgical_department) {MML::Department.new(name: [surgical_department_name])}
  let(:patient_department_name) {MML::DepartmentName.new(repCode: 'A', tableId: 'MML0025', value: 'Internal medicine')}
  let(:patient_department) {MML::Department.new(name: [patient_department_name])}
  let(:registered_diagnosis) {MML::RegisteredDiagnosis.new(diagnosis: 'Lung cancer')}
  let(:operation_element_item) {MML::OperationElementItem.new(title: 'coronary artery bipass grafting', code: 'K552', system: 'MHLW')}
  let(:procedure_item) {MML::ProcedureItem.new(operation: 'right lobectomy', code: 'K511', system: 'MHLW', operationElement: [operation_element_item], procedureMemo: 'off pump')}
  let(:surgical_item) {MML::SurgicalItem.new(type: 'elective', date: '2013-12-10', startTime: '08:30', duration: 'PT5H25M', surgicalDepartment: surgical_department, patientDepartment: patient_department, surgicalDiagnosis: [registered_diagnosis], surgicalProcedure: [procedure_item])}

  it 'is an instance of MML::SurgicalItem' do
    expect(surgical_item).to be_an_instance_of MML::SurgicalItem
  end

  it 'type should be assigned properly' do
    expect(surgical_item.type).to eq 'elective'
  end

  it 'type is optional' do
    expect {surgical_item.type = nil}.not_to raise_error
  end

  it 'date should be assigned properly' do
    expect(surgical_item.date).to eq '2013-12-10'
  end

  it 'data is mandatory' do
    expect{surgical_item.date = nil}.to raise_error ArgumentError
  end

  it 'startTime should be assigned properly' do
    expect(surgical_item.startTime).to eq '08:30'
  end

  it 'startTime should be assigned properly' do
    expect {surgical_item.startTime = nil}.not_to raise_error
  end

  it 'duration should be assigned properly' do
    expect(surgical_item.duration).to eq 'PT5H25M'
  end

  it 'duration is optional' do
    expect {surgical_item.duration = nil}.not_to raise_error
  end

  it 'surgicalDepartment should be assigned properly' do
    expect(surgical_item.surgicalDepartment.name[0].value).to eq 'Cardiovascular surgery'
  end

  it 'surgicalDepartment is optional' do
    expect {surgical_item.surgicalDepartment = nil}.not_to raise_error
  end

  it 'patientDepartment should be assigned properly' do
    expect(surgical_item.patientDepartment.name[0].value).to eq 'Internal medicine'
  end

  it 'patientDepartment is optional' do
    expect {surgical_item.patientDepartment = nil}.not_to raise_error
  end

  it 'surgicalDiagnosis should be assigned properly' do
    expect(surgical_item.surgicalDiagnosis[0].diagnosis).to eq 'Lung cancer'
  end

  it 'surgicalDiagnosis is mandatory' do
    expect {surgical_item.surgicalDiagnosis = nil}.to raise_error ArgumentError
  end

  it 'surgicalProcedure is properly assigned' do
    expect(surgical_item.surgicalProcedure[0].operation).to eq 'right lobectomy'
  end
end
