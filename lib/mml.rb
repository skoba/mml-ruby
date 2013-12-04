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
          attributes = {'mmlPi:subtype' => nationality.subtype} if nationality.subtype
          xml.mmlPi :nationality, nationality.value, attributes
        end
        if race
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

  class BaseClinic
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
    optional_attribute :identifiedDate
  end

  require_relative 'mml/common'
  require_relative 'mml/version'
end
