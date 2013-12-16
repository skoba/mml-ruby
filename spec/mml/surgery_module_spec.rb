describe MML::Surgery do
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
  let(:surgery_item) {MML::SurgeryItem.new(type: 'elective', date: '2013-12-10', startTime: '08:30', duration: 'PT5H25M', surgicalDepartment: surgical_department, patientDepartment: patient_department, surgicalDiagnosis: [registered_diagnosis], surgicalProcedure: [procedure_item], anesthesiaProcedure: [anesthesia_procedure], anesthesiologists: [anesthesiologist], anesthesiaDuration: 'PT6H25M', operativeNotes: 'Total bleeding: 380ml', referenceInfo: [ext_ref], memo: 'This operation was well performed.')}
  let(:surgery) {MML::Surgery.new(surgeryItem: [surgery_item])}

  it 'is an instance of MML::Surgery' do
    expect(surgery).to be_an_instance_of MML::Surgery
  end

  it 'has more than 1 surgical item' do
    expect(surgery.surgeryItem.size).to be >= 1
  end

  it 'surgeryItem should be assigned properly' do
    expect(surgery.surgeryItem[0].surgicalProcedure[0].operation).to eq 'right lobectomy'
  end

  describe '#to_xml' do
    subject {surgery.to_xml}

    it {should match '<mmlSg:SurgeryModule>'}
    it {should match '<mmlSg:surgeryItem>'}
    it {should match '<mmlSg:surgicalInfo mmlSg:type="elective"><mmlSg:date>2013-12-10</mmlSg:date>'}
    it {should match '<mmlSg:startTime>08:30</mmlSg:startTime>'}
    it {should match '<mmlSg:duration>PT5H25M</mmlSg:duration>'}
    it {should match '<mmlSg:surgicalDepartment>'}
    it {should match '<mmlDp:Department><mmlDp:name mmlDp:repCode="A" mmlDp:tableId="MML0025">Cardiovascular surgery</mmlDp:name></mmlDp:Department>'}
    it {should match '</mmlSg:surgicalDepartment>'}
    it {should match '<mmlSg:patientDepartment>'}
    it {should match '<mmlDp:Department><mmlDp:name mmlDp:repCode="A" mmlDp:tableId="MML0025">Internal medicine</mmlDp:name></mmlDp:Department>'}
    it {should match '</mmlSg:patientDepartment>'}
    it {should match '</mmlSg:surgicalInfo><mmlSg:surgicalDiagnosis>'}
    it {should match '<mmlRd:RegisteredDiagnosisModule><mmlRd:diagnosis>Lung cancer</mmlRd:diagnosis></mmlRd:RegisteredDiagnosisModule></mmlSg:surgicalDiagnosis>'}
    it {should match '<mmlSg:surgicalProcedure>'}
    it {should match '<mmlSg:procedureItem>'}
    it {should match '<mmlSg:operation'}
    it {should match 'mmlSg:code="K511"'}
    it {should match 'mmlSg:system="MHLW"'}
    it {should match '>right lobectomy</mmlSg:operation>'}
    it {should match '<mmlSg:operationElement><mmlSg:operationElementItem><mmlSg:title'}
    it {should match 'mmlSg:code="K552"'}
    it {should match 'mmlSg:system="MHLW"'}
    it {should match 'coronary artery bipass grafting</mmlSg:title></mmlSg:operationElementItem></mmlSg:operationElement>'}
    it {should match '<mmlSg:procedureMemo>off pump</mmlSg:procedureMemo></mmlSg:procedureItem>'}
    it {should match '</mmlSg:surgicalProcedure>'}
    it {should match '</mmlSg:surgeryItem>'}
    it {should match '</mmlSg:SurgeryModule>'}
  end
end
