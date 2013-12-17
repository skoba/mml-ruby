describe MML::SurgeryItem do
  let(:surgical_department_name) {MML::DepartmentName.new(repCode: 'A', tableId: 'MML0025', value: 'Cardiovascular surgery')}
  let(:surgical_department) {MML::Department.new(name: [surgical_department_name])}
  let(:patient_department_name) {MML::DepartmentName.new(repCode: 'A', tableId: 'MML0025', value: 'Internal medicine')}
  let(:patient_department) {MML::Department.new(name: [patient_department_name])}
  let(:registered_diagnosis) {MML::RegisteredDiagnosis.new(diagnosis: 'Lung cancer')}
  let(:operation_element_item) {MML::OperationElementItem.new(title: 'coronary artery bipass grafting', code: 'K552', system: 'MHLW')}
  let(:procedure_item) {MML::ProcedureItem.new(operation: 'right lobectomy', code: 'K511', system: 'MHLW', operationElement: [operation_element_item], procedureMemo: 'off pump')}
  let(:staff_id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '00123')}
  let(:staff_name) {MML::Name.new(repCode: 'A', fullname: 'Hiroyuki Yoshihara')}
  let(:staff_info) {MML::PersonalizedInfo.new(id: staff_id, personName: [staff_name])}
  let(:staff) {MML::SurgicalStaff.new(staffClass: 'assistant', superiority: 1, staffInfo: staff_info)}
  let(:anesthesia_procedure){MML::AnesthesiaProcedure.new(title: 'general anesthesia', code: 'L002', system: 'MHLW')}
  let(:anesthesiologist_id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '00123')}
  let(:anesthesiologist_name) {MML::Name.new(repCode: 'A', fullname: 'Kenji ARAKI')}
  let(:anesthesiologist_info) {MML::PersonalizedInfo.new(id: staff_id, personName: [anesthesiologist_name])}
  let(:anesthesiologist) {MML::Anesthesiologist.new(staffClass: 'main anesthesiologist', superiority: 1, staffInfo: anesthesiologist_info)}
  let(:ext_ref) {MML::ExtRef.new(contentType: 'image/gif', medicalRole: 'surgicalFigure', title: 'skin incision', href: 'patient001/surgicalFigure001.gif')}
  let(:surgery_item) {MML::SurgeryItem.new(type: 'elective', date: '2013-12-10', startTime: '08:30', duration: 'PT5H25M', surgicalDepartment: surgical_department, patientDepartment: patient_department, surgicalDiagnosis: [registered_diagnosis], surgicalProcedure: [procedure_item], surgicalStaffs: [staff],anesthesiaProcedure: [anesthesia_procedure], anesthesiologists: [anesthesiologist], anesthesiaDuration: 'PT6H25M', operativeNotes: 'Total bleeding: 380ml', referenceInfo: [ext_ref], memo: 'This operation was well performed.')}

  it 'is an instance of MML::SurgicalItem' do
    expect(surgery_item).to be_an_instance_of MML::SurgeryItem
  end

  it 'type should be assigned properly' do
    expect(surgery_item.type).to eq 'elective'
  end

  it 'type is optional' do
    expect {surgery_item.type = nil}.not_to raise_error
  end

  it 'date should be assigned properly' do
    expect(surgery_item.date).to eq '2013-12-10'
  end

  it 'data is mandatory' do
    expect{surgery_item.date = nil}.to raise_error ArgumentError
  end

  it 'startTime should be assigned properly' do
    expect(surgery_item.startTime).to eq '08:30'
  end

  it 'startTime should be assigned properly' do
    expect {surgery_item.startTime = nil}.not_to raise_error
  end

  it 'duration should be assigned properly' do
    expect(surgery_item.duration).to eq 'PT5H25M'
  end

  it 'duration is optional' do
    expect {surgery_item.duration = nil}.not_to raise_error
  end

  it 'surgicalDepartment should be assigned properly' do
    expect(surgery_item.surgicalDepartment.name[0].value).to eq 'Cardiovascular surgery'
  end

  it 'surgicalDepartment is optional' do
    expect {surgery_item.surgicalDepartment = nil}.not_to raise_error
  end

  it 'patientDepartment should be assigned properly' do
    expect(surgery_item.patientDepartment.name[0].value).to eq 'Internal medicine'
  end

  it 'patientDepartment is optional' do
    expect {surgery_item.patientDepartment = nil}.not_to raise_error
  end

  it 'surgicalDiagnosis should be assigned properly' do
    expect(surgery_item.surgicalDiagnosis[0].diagnosis).to eq 'Lung cancer'
  end

  it 'surgicalDiagnosis is mandatory' do
    expect {surgery_item.surgicalDiagnosis = nil}.to raise_error ArgumentError
  end

  it 'surgicalProcedure is properly assigned' do
    expect(surgery_item.surgicalProcedure[0].operation).to eq 'right lobectomy'
  end

  it 'surgicalStaffs should be assigned properly' do
    expect(surgery_item.surgicalStaffs[0].staffClass).to eq 'assistant'
  end

  it 'anesthesiaProcedure should be assigned properly' do
    expect(surgery_item.anesthesiaProcedure[0].title).to eq 'general anesthesia'
  end

  it 'anesthesiologists should be assigned properly' do
    expect(surgery_item.anesthesiologists[0].staffInfo.personName[0].fullname).to eq 'Kenji ARAKI'
  end

  it 'anesthesiologists is optional' do
    expect {surgery_item.anesthesiologists = nil}.not_to raise_error
  end

  it 'anesthesiaDuration should be assigned properly' do
    expect(surgery_item.anesthesiaDuration).to eq 'PT6H25M'
  end

  it 'anesthesiaDuration is optional' do
    expect {surgery_item.anesthesiaDuration}.not_to raise_error
  end

  it 'operativeNotes should be assigned properly' do
    expect(surgery_item.operativeNotes).to eq 'Total bleeding: 380ml'
  end

  it 'operativeNotes is optional' do
    expect {surgery_item.operativeNotes = nil}.not_to raise_error
  end

  it 'referenceInfo should be assigned properly' do
    expect(surgery_item.referenceInfo[0].title).to eq 'skin incision'
  end

  it 'referenceInfo is optional' do
    expect {surgery_item.referenceInfo = nil}.not_to raise_error
  end

  it 'memo should be assigned properly' do
    expect(surgery_item.memo).to eq 'This operation was well performed.'
  end

  it 'memo is optional' do
    expect {surgery_item.memo = nil}.not_to raise_error
  end
end
