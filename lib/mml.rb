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

    def to_xml
      xml = Builder::XmlMarkup.new
      eval xml_builder
    end

    private
    def xml_builder
      File.read(xml_builder_file)
    end

    def xml_builder_file
      File.join(this_file_path, 'xml', "#{builder_file_prefix}.xml.builder")
    end

    def builder_file_prefix
      self.class.to_s.split('::').last.downcase
    end

    def this_file_path
      File.expand_path(File.dirname(__FILE__))
    end
  end

  require_relative 'version'
  require_relative 'common'

  class PatientInfo < Base
    mandatory_attribute :masterId, :personName, :birthday, :sex
    optional_attribute :otherId, :nationality, :race, :marital, :addresses,
    :emailAddresses, :phones, :accountNumber, :socialIdentification, :death
  end

  class OtherId < Base
    mandatory_attribute :id, :type
  end

  class Nationality < Base
    mandatory_attribute :value
    optional_attribute :subtype
  end

  class Death < Base
    mandatory_attribute :flag
    optional_attribute :date
  end

  class Race < Base
    mandatory_attribute :value
    optional_attribute :raceCode, :raceCodeId
  end

  class Insurance < Base
    mandatory_attribute :group, :number, :familyClass, :startDate, :expiredDate
    optional_attribute :countryType, :insuranceClass, :insuranceNumber,
     :personName, :clientInfo, :continuedDiseases, :paymentInRatio,
     :paymentOutRatio, :insuredInfo, :workInfo, :publicInsurance
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
    mandatory_attribute :priority, :provider, :recipient, :startDate,
    :expiredDate
    optional_attribute :providerName, :paymentRatio, :ratioType
  end

  class RegisteredDiagnosis < Base
    mandatory_attribute :diagnosis
    optional_attribute :code, :system, :diagnosisContents, :categories,
    :startDate, :endDate, :outcome, :firstEncounterDate, :relatedHealthInsurance
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
  end

  class BaseClinic < Base
    optional_attribute :allergy, :bloodtype, :infection
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
  end

  class FamilyHistoryItem < Base
    mandatory_attribute :relation, :registeredDiagnosis
    optional_attribute :age, :memo
  end

  class BirthInfo < Base
    optional_attribute :facility, :deliveryWeeks, :deliveryMethod,
    :bodyWeight, :bodyWeightUnit, :bodyHeight, :bodyHeightUnit,
    :chestCircumference, :chestCircumferenceUnit, :headCircumference,
    :headCircumferenceUnit, :memo
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
     mandatory_attribute :surgeryItem
  end

  class SurgeryItem < Base
    mandatory_attribute :date, :surgicalDiagnosis, :surgicalProcedure
    optional_attribute :type, :startTime, :duration, :surgicalDepartment,
     :surgicalStaffs, :patientDepartment, :anesthesiaProcedure,
     :anesthesiologists, :anesthesiaDuration, :operativeNotes,
     :referenceInfo, :memo
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

  class AnesthesiaProcedure < OperationElementItem

  end

  class Anesthesiologist < SurgicalStaff

  end

  class Summary < Base
    optional_attribute :serviceHistory, :registeredDiagnosis, :deathInfo, :surgeryModule, :chiefComplaints, :patientProfile, :history, :physicalExam, :clinicalCourse, :dischargeFindings, :medication, :testResults, :plan, :remarks
  end

  class ServiceHistory < Base
    optional_attribute :start, :end, :outPatient, :inPatient
  end

  class OutpatientItem < Base
    mandatory_attribute :date
    optional_attribute :first, :emergency, :outPatientCondition, :staffs
  end

  class InpatientItem < Base
    mandatory_attribute :admission, :discharge
    optional_attribute :staffs
  end

  class Admission < Base
    mandatory_attribute :date
    optional_attribute :admissionCondition, :emergency, :referFrom
  end

  class StaffInfo < CreatorInfo

  end

  class Discharge < Base
    mandatory_attribute :date
    optional_attribute :dischargeCondition, :outcome, :referTo
  end

  class DeathInfo < Base
    optional_attribute :date, :autopsy
    mandatory_attribute :value
  end

  class ClinicalRecord < Base
    mandatory_attribute :value
    optional_attribute :date, :extRef, :relatedDoc
  end

  class RelatedDoc < Base
    mandatory_attribute :value
    optional_attribute :relation
  end

  class TestResult < ValueWithLink
    optional_attribute :date
  end

  class LabTest < Base
    mandatory_attribute :registId, :registTime, :reportTime, :reportStatus, :statusCode, :statusCodeId, :facility, :facilityCode, :facilityCodeId, :laboratoryCenter, :centerCode, :centerCodeId
    optional_attribute :sampleTime, :set, :setCode, :setCodeId, :department, :depCode, :depCodeId, :ward, :wardCode, :wardCodeId, :client, :clientCode, :clientCodeId, :technician, :techCode, :techCodeId
  end

  require_relative 'parser/xml_parser'
end

