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

  require_relative 'mml/common'
  require_relative 'mml/version'
end
