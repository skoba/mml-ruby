require 'builder'

module MML
  MML_NAMESPACE = 'xmlns:mml="http://www.medxml.net/MML"'

  class Base
    def initialize(args = {})
      args.keys.each do |item|
        send "#{item.to_s}=", args[item]
      end
    end

    def namespace
      MML_NAMESPACE
    end

    class << self
      alias optional_attribute attr_accessor

      def mandatory_attribute(*attrs)
        attrs.each do |attr|
          class_eval %{
            attr_reader attr
            
            def #{attr}=(value)
              raise ArgumentError, '#{attr} is mandatory' if value.nil?
              @#{attr}=value
            end
          }
        end
      end
    end

    private
    def xml
      @xml ||= Builder::XmlMarkup.new
    end
  end

  class V2Base < Base
    MML_VERSION = '2.3'
  end

  class PatientInfo < Base
    mandatory_attribute :masterId, :personName, :birthday, :sex
    optional_attribute :otherId, :nationality, :race, :marital, :addresses, :emailAddresses, :phones, :accountNumber, :socialIdentification, :death

    def to_xml
      xml.mmlPi :PatientModule do
        xml.mmlPi :uniqueInfo do
          xml.mmlPi :masterId do
            xml << masterId.to_xml
          end
          otherId.each do |item|
            xml.mmlPi :otherId, {'mmlPi:type' => item.type} do
              xml << item.id.to_xml
            end
          end if otherId
        end
        personName.each do |name|
          xml.mmlPi :personName do
            xml << name.to_xml
          end
        end
        xml.mmlPi :birthday, birthday
        xml.mmlPi :sex, sex
        if nationality
          attributes = nil
          attributes = {'mmlPi:subtype' => nationality.subtype} if nationality.subtype
          xml.mmlPi :nationality, nationality.value, attributes
        end
        if race
          attributes = nil
          attributes = {'mmlPi:raceCode' => race.raceCode} if race.raceCode
          attributes['mmlPi:raceCodeId'] = race.raceCodeId if race.raceCodeId
          xml.mmlPi :race, race.value, attributes
        end
        xml.mmlPi :marital, marital
        xml.mmlPi :addresses do
          addresses.each do |address|
            xml << address.to_xml
          end
        end if addresses
        xml.mmlPi :emailAddresses do
          emailAddresses.each do |email|
            xml.mmlCm :email, email
          end if emailAddresses
        end if emailAddresses
        xml.mmlPi :phones do
          phones.each do |phone|
            xml << phone.to_xml
          end
        end if phones
        xml.mmlPi :accountNumber, accountNumber if accountNumber
        xml.mmlPi :socialIdentification, socialIdentification if socialIdentification
        death_attr = nil
        death_attr = {'mmlPi:date' => death.date} if death.date
        xml.mmlPi :death, death.flag.to_s, death_attr unless death.nil?
      end
    end
  end

  class OtherId < Base
    mandatory_attribute :id, :type
  end

  class Nationality < Base
    optional_attribute :subtype
    mandatory_attribute :value
  end

  class Death < Base
    mandatory_attribute :flag
    optional_attribute :date
  end

  class Race < Base
    optional_attribute :raceCode, :raceCodeId
    mandatory_attribute :value
  end

  class Insurance < Base
    optional_attribute :countryType, :insuranceClass, :insuranceNumber, :personName, :clientInfo, :continuedDiseases, :paymentInRatio, :paymentOutRatio, :insuredInfo, :workInfo, :publicInsurance
    mandatory_attribute :group, :number, :familyClass, :startDate, :expiredDate

    def to_xml
      attributes = {'mmlHi:countryType' => countryType } if countryType
      xml.mmlHi :HealthInsuranceModule, attributes do
        attributes = {'mmlHi:ClassCode' => '01'} if insuranceClass.classCode
        attributes['mmlHi:tableId'] = insuranceClass.tableId if insuranceClass.tableId
        xml.mmlHi :insuranceClass, insuranceClass.value, attributes if insuranceClass
        xml.mmlHi :insuranceNumber, insuranceNumber
        xml.mmlHi :clientId do
          xml.mmlHi :group, group
          xml.mmlHi :number, number
        end
        xml.mmlHi :familyClass, familyClass
        xml.mmlHi :clientInfo do
          xml.mmlHi :personName do
            clientInfo.personName.each do |name|
              xml << name.to_xml
            end
          end if clientInfo.personName
          xml.mmlHi :addresses do
            clientInfo.addresses.each do |address|
              xml << address.to_xml
            end
          end if clientInfo.addresses
          xml.mmlHi :phones do
            clientInfo.phones.each do |phone|
              xml << phone.to_xml
            end
          end if clientInfo.phones
        end if clientInfo
        xml.mmlHi :continuedDiseases do
          continuedDiseases.each do |disease|
            xml.mmlHi :disease, disease
          end
        end if continuedDiseases
        xml.mmlHi :startDate, startDate
        xml.mmlHi :expiredDate, expiredDate
        xml.mmlHi :paymentInRatio, paymentInRatio if paymentInRatio
        xml.mmlHi :paymentOutRatio, paymentOutRatio if paymentOutRatio
        xml.mmlHi :insuredInfo do
          xml.mmlHi :facility do
            xml << insuredInfo.facility.to_xml if insuredInfo.facility
          end if insuredInfo.facility
          xml.mmlHi :addresses do
            insuredInfo.addresses.each do |address|
              xml << address.to_xml
            end
          end if insuredInfo.addresses
          xml.mmlHi :phones do
            insuredInfo.phones.each do |phone|
              xml << phone.to_xml
            end
          end if insuredInfo.phones
        end if insuredInfo
        xml.mmlHi :workInfo do
          xml.mmlHi :facility do
            xml << workInfo.facility.to_xml
          end if workInfo.facility
          xml.mmlHi :addresses do
            workInfo.addresses.each do |address|
              xml << address.to_xml
            end
          end if workInfo.addresses
          xml.mmlHi :phones do
            workInfo.phones.each do |phone|
              xml << phone.to_xml
            end
          end
        end if workInfo
        xml.mmlHi :publicInsurance do
          publicInsurance.each do |item|
            attribute = nil
            attribute = {'mmlHi:priority' => item.priority} if item.priority
            xml.mmlHi :publicInsuranceItem, attribute do
              xml.mmlHi :providerName, item.providerName if item.providerName
              xml.mmlHi :provider, item.provider
              xml.mmlHi :recipient, item.recipient
              xml.mmlHi :startDate, item.startDate
              xml.mmlHi :expiredDate, item.expiredDate
              xml.mmlHi :paymentRatio, item.paymentRatio, {'mmlHi:ratioType' => item.ratioType} if item.paymentRatio
            end
          end
        end if publicInsurance
      end
    end
  end

  class InsuranceClass < Base
    mandatory_attribute :value, :classCode, :tableId
  end

  class InsuranceClient < Base
    optional_attribute :personName, :addresses, :phones
  end

  class OrganizationInfo < Base
    optional_attribute :facility, :addresses, :phones
  end

  class PublicInsuranceItem < Base
    mandatory_attribute :priority, :provider, :recipient, :startDate, :expiredDate
    optional_attribute :providerName, :paymentRatio, :ratioType
  end

  class RegisteredDiagnosis < Base
    mandatory_attribute :diagnosis
    optional_attribute :code, :system, :diagnosisContents, :categories, :startDate, :endDate, :outcome, :firstEncounterDate, :relatedHealthInsurance

    def to_xml
      xml.mmlRd :RegisteredDiagnosisModule do
        attributes = nil
        attributes = {'mmlRd:code' => code} if code
        attributes['mmlRd:system'] = system if system
        xml.mmlRd :diagnosis, attributes, diagnosis
        xml.mmlRd :diagnosisContens do
          diagnosisContents.each do |item|
            attributes = nil
            attributes = {'mmlRd:code' => item.code} if item.code
            attributes['mmlRd:system'] = item.system if item.system
            xml.mmlRd :dxItem, attributes do
              xml.mmlRd :name, item.name
            end
          end
        end if diagnosisContents
        xml.mmlRd :categories do
          categories.each do |category|
            xml.mmlRd :category, {'mmlRd:tableId' => category.tableId}, category.value
          end if categories
        end
        xml.mmlRd :startDate, startDate if startDate
        xml.mmlRd :endDate, endDate if endDate
        xml.mmlRd :outcome, outcome if outcome
        xml.mmlRd :firstEncounterDate, firstEncounterDate if firstEncounterDate
        attributes = 
        xml.mmlRd :relatedHealthInsurance, {'mmlRd:uid' => relatedHealthInsurance} if relatedHealthInsurance
      end
    end
  end

  class DxItem < Base
    mandatory_attribute :name
    optional_attribute :code, :system
  end

  class DiagnosticCategory < Base
    mandatory_attribute :value, :tableId
  end

  class Lifestyle < Base
    mandatory_attribute :occupation, :tobacco, :alcohol
    optional_attribute :other

    def to_xml
      xml.mmlLs :LifestyleModule do
        xml.mmlLs :occupation, occupation
        xml.mmlLs :tobacco, tobacco
        xml.mmlLs :alcohol, alcohol
        xml.mmlLs :other, other if other
      end
    end
  end

  class BaseClinic < Base
    optional_attribute :allergy, :bloodtype, :infection

    def to_xml
      xml.mmlBc :BaseClinicModule do
        xml.mmlBc :allergy do
          allergy.each do |item|
            xml.mmlBc :allergyItem do
              xml.mmlBc :factor, item.factor
              xml.mmlBc :severity, item.severity if item.severity
              xml.mmlBc :identifiedDate, item.identifiedDate if item.identifiedDate
              xml.mmlBc :memo, item.memo if item.memo
            end
          end
        end if allergy
        xml.mmlBc :bloodtype do
          xml.mmlBc :abo, bloodtype.abo
          xml.mmlBc :rh, bloodtype.rh if bloodtype.rh
          xml.mmlBc :others do
            bloodtype.others.each do |other|
              xml.mmlBc :other do
                xml.mmlBc :typeName, other.typeName
                xml.mmlBc :typeJudgement, other.typeJudgement
                xml.mmlBc :description, other.description if other.description
              end
            end
          end if bloodtype.others
          xml.mmlBc :memo, bloodtype.memo if bloodtype.memo
        end if bloodtype
        xml.mmlBc :infection do
          infection.each do |item|
            xml.mmlBc :infectionItem do
              xml.mmlBc :factor, item.factor
              xml.mmlBc :examValue, item.examValue
              xml.mmlBc :identifiedDate, item.identifiedDate if item.identifiedDate
              xml.mmlBc :memo, item.memo if item.memo
            end
          end
        end if infection
      end
    end
  end

  class AllergyItem < Base
    mandatory_attribute :factor
    optional_attribute :severity, :identifiedDate, :memo
  end

  class BloodType < Base
    mandatory_attribute :abo
    optional_attribute :rh, :others, :memo
  end

  class OtherBloodType < Base
    mandatory_attribute :typeName, :typeJudgement
    optional_attribute :description
  end

  class InfectionItem < Base
    mandatory_attribute :factor, :examValue
    optional_attribute :identifiedDate, :memo
  end

  class FirstClinic < Base
    optional_attribute :familyHistory, :birthInfo, :vaccination, :pastHistory,
                       :chiefComplaints, :presentIllnessNotes

    def to_xml
      xml.mmlFcl :FirstClinicModule do
        xml.mmlFcl :familyHistory do
          familyHistory.each do |item|
            xml.mmlFcl :familyHistoryItem do
              xml.mmlFcl :relation, item.relation
              xml << item.registeredDiagnosis.to_xml
              xml.mmlFcl :age, item.age
              xml.mmlFcl :memo, item.memo
            end
          end
        end if familyHistory
        xml.mmlFcl :childhood do
          xml.mmlFcl :birthInfo do
            xml << birthInfo.facility.to_xml if birthInfo.facility
            xml.mmlFcl :deliveryWeeks, birthInfo.deliveryWeeks if birthInfo.deliveryWeeks
            xml.mmlFcl :deliveryMethod, birthInfo.deliveryMethod if birthInfo.deliveryMethod
            xml.mmlFcl :bodyWeight, birthInfo.bodyWeight, {'mmlFcl:unit' => birthInfo.bodyWeightUnit} if birthInfo.bodyWeight
            xml.mmlFcl :bodyHeight, birthInfo.bodyHeight, {'mmlFcl:unit' => birthInfo.bodyHeightUnit} if birthInfo.bodyHeight
            xml.mmlFcl :chestCircumference, birthInfo.chestCircumference, {'mmlFcl:unit' => birthInfo.chestCircumferenceUnit} if birthInfo.chestCircumference
            xml.mmlFcl :headCircumference, birthInfo.headCircumference, {'mmlFcl:unit' => birthInfo.headCircumferenceUnit} if birthInfo.headCircumference
            xml.mmlFcl :memo, birthInfo.memo if birthInfo.memo
          end if birthInfo
          xml.mmlFcl :vaccination do
            vaccination.each do |item|
              xml.mmlFcl :vaccinationItem do
                xml.mmlFcl :vaccine, item.vaccine
                xml.mmlFcl :injected, item.injected
                xml.mmlFcl :age, item.age if item.age
                xml.mmlFcl :memo, item.memo if item.memo
              end
            end
          end if vaccination
        end if birthInfo or vaccination
        xml.mmlFcl :pastHistory do
          xml.mmlFcl :freeNote, pastHistory.freeNote if pastHistory.freeNote
          pastHistory.pastHistoryItem.each do |item|
            xml.mmlFcl :pastHistoryItem do
              xml.mmlFcl :timeExpression, item.timeExpression
              item.eventExpression.each do |event|
                xml.mmlFcl :eventExpression, event
              end if item.eventExpression
            end
          end if pastHistory.pastHistoryItem
        end if pastHistory
        xml.mmlFcl :chiefComplaints, chiefComplaints if chiefComplaints
        xml.mmlFcl :presentIllnessNotes, presentIllnessNotes if presentIllnessNotes
      end
    end
  end

  class FamilyHistoryItem < Base
    mandatory_attribute :relation, :registeredDiagnosis
    optional_attribute :age, :memo
  end

  class BirthInfo < Base
    optional_attribute :facility, :deliveryWeeks, :deliveryMethod, :bodyWeight, :bodyWeightUnit, :bodyHeight, :bodyHeightUnit, :chestCircumference, :chestCircumferenceUnit, :headCircumference, :headCircumferenceUnit, :memo
  end

  class VaccinationItem < Base
    mandatory_attribute :vaccine, :injected
    optional_attribute :age, :memo
  end

  class PastHistory < Base
    optional_attribute :freeNote, :pastHistoryItem
  end

  class PastHistoryItem < Base
    mandatory_attribute :timeExpression
    optional_attribute :eventExpression
  end

  class ProgressCourse < Base
    optional_attribute :freeExpression, :extRef, :structuredExpression

    def to_xml
      xml.mmlPc :ProgressCourseModule do
        xml.mmlPc :FreeExpression do
          xml << freeExpression
          extRef.each do |ref|
            xml << ref.to_xml
          end if extRef
        end if freeExpression
        xml.mmlPc :structuredExpression do
          structuredExpression.each do |item|
            xml.mmlPc :problemItem do
              attributes = nil
              attributes = {'mmlPc:dxUid' => item.dxUid} if item.dxUid
              xml.mmlPc :problem, item.problem, attributes
              xml.mmlPc :subjective do
                xml.mmlPc :freeNotes, item.subjective.freeNotes if item.subjective.freeNotes
                xml.mmlPc :subjectiveItem do
                  item.subjective.subjectiveItem.each do |sitem|
                    xml.mmlPc :timeExpression, sitem.timeExpression
                    sitem.eventExpression.each do |event|
                      xml.mmlPc :eventExpression, event
                    end if sitem.eventExpression
                  end
                end if item.subjective.subjectiveItem
              end if item.subjective
              xml.mmlPc :objective do
                xml.mmlPc :objectiveNotes, item.objective.objectiveNotes if item.objective.objectiveNotes
                xml.mmlPc :physicalExam do
                  item.objective.physicalExam.each do |pitem|
                    xml.mmlPc :physicalExamItem do
                      xml.mmlPc :title, pitem.title
                      xml.mmlPc :result, pitem.result
                      xml.mmlPc :interpretation, pitem.interpretation if pitem.interpretation
                      xml.mmlPc :referenceInfo do
                        pitem.referenceInfo.each do |ref|
                          xml << ref.to_xml
                        end
                      end if pitem.referenceInfo
                    end
                  end
                end if item.objective.physicalExam
                xml.mmlPc :testResult do
                  xml << item.objective.testResult.value
                  item.objective.testResult.link.each do |ref|
                    xml << ref.to_xml
                  end if item.objective.testResult.link
                end if item.objective.testResult
                xml.mmlPc :rxRecord do
                  xml << item.objective.rxRecord.value
                  item.objective.rxRecord.link.each do |ref|
                    xml << ref.to_xml
                  end if item.objective.rxRecord.link
                end if item.objective.rxRecord
                xml.mmlPc :txRecord do
                  xml << item.objective.txRecord.value
                  item.objective.txRecord.link.each do |ref|
                    xml << ref.to_xml
                  end
                end if item.objective.txRecord
              end if item.objective
              xml.mmlPc :assessment do
                item.assessment.each do |aitem|
                  xml.mmlPc :assessmentItem, aitem
                end
              end if item.assessment
              xml.mmlPc :plan do
                xml.mmlPc :testOrder do
                  xml << item.plan.testOrder.value
                  item.plan.testOrder.link.each do |ref|
                    xml << ref.to_xml
                  end if item.plan.testOrder.link
                end if item.plan.testOrder
                xml.mmlPc :rxOrder do
                  xml << item.plan.rxOrder.value
                  item.plan.rxOrder.link.each do |ref|
                    xml << ref.to_xml
                  end if item.plan.rxOrder.link
                end if item.plan.rxOrder
                xml.mmlPc :txOrder do
                  xml << item.plan.txOrder.value
                  item.plan.txOrder.link.each do |ref|
                    xml << ref.to_xml
                  end if item.plan.txOrder.link
                end if item.plan.txOrder
                xml.mmlPc :planNotes, item.plan.planNotes
              end if item.plan
            end
          end
        end if structuredExpression
      end
    end
  end

  class ProblemItem < Base
    optional_attribute :problem, :dxUid, :subjective, :objective, :assessment, :plan
  end

  class ValueWithLink < Base
    mandatory_attribute :value
    optional_attribute :link
  end

  class SubjectiveItem < Base
    mandatory_attribute :timeExpression, :eventExpression
  end

  class Subjective < Base
    optional_attribute :freeNotes, :subjectiveItem
  end

  class Objective < Base
    optional_attribute :objectiveNotes, :physicalExam, :testResult, :rxRecord, :txRecord
  end

  class PhysicalExamItem < Base
    mandatory_attribute :title, :result
    optional_attribute :interpretation, :referenceInfo
  end

  class Plan < Base
    optional_attribute :testOrder, :rxOrder, :txOrder, :planNotes
  end

  class Surgery < Base
  end

  class SurgicalItem < Base
    mandatory_attribute :date, :surgicalDiagnosis, :surgicalProcedure
    optional_attribute :type, :startTime, :duration, :surgicalDepartment, :patientDepartment
  end

  class ProcedureItem < Base
    optional_attribute :operation, :code, :system, :operationElement, :procedureMemo
  end

  class OperationElementItem < Base
    mandatory_attribute :title
    optional_attribute :code, :system
  end

  class SurgicalStaff < Base
    mandatory_attribute :staffInfo
    optional_attribute :staffClass, :superiority
  end

  require_relative 'mml/common'
  require_relative 'mml/version'
end
