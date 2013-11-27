require 'builder'
require_relative '../mml'

module MML
  class BaseName < Base
    mandatory_attribute :value, :repCode
    optional_attribute :tableId
  end

  class FacilityName < BaseName

  end

  class DepartmentName < BaseName

  end

  class Name < BaseName
    optional_attribute :family, :given, :middle, :fullname, :prefix, :degree

    undef value=

    def to_xml
      xml.mmlNm(:Name, {'mmlNm:repCode' => @repCode, 'mmlNm:tableId' => @tableId}) do
        xml.mmlNm :family, @family if @family
        xml.mmlNm :middle, @middle if @middle
        xml.mmlNm :given, @given if @given
        xml.mmlNm :fullname, @fullname if @fullname
        xml.mmlNm :prefix, @prefix if @prefix
        xml.mmlNm :degree, @degree if @degree
      end
    end
  end

  class Id < Base
    mandatory_attribute :value, :type, :tableId
    optional_attribute :checkDigit, :checkDigitSchema

    def to_xml
      attributes = {'mmlCm:type' => type, 'mmlCm:tableId' => tableId }
      attributes['mmlCm:checkDigit'] = checkDigit if checkDigit
      attributes['mmlCm:checkDigitSchema'] = checkDigitSchema if checkDigitSchema
      xml.mmlCm :Id,  value, attributes
    end
  end

  class ExtRef < Base
    mandatory_attribute :href
    optional_attribute :contentType, :medicalRole, :title

    def to_xml
      attributes = { 'mmlCm:href' => href }
      attributes['mmlCm:contentType'] = contentType if contentType
      attributes['mmlCm:medicalRole'] = medicalRole if medicalRole
      attributes['mmlCm:title'] = title if title
      xml.mmlCm :extRef, attributes
    end
  end

  class Address < Base
    mandatory_attribute :repCode
    optional_attribute :addressClass, :tableId, :homeNumber, :town, :city, :prefecture, :full, :zip, :countryCode

    def to_xml
      attributes = { 'mmlAd:repCode' => repCode }
      attributes['mmlAd:addressClass'] = addressClass
      attributes['mmlAd:tableId'] = tableId
      xml.mmlAd :Address, attributes do
        xml.mmlAd :homeNumber, homeNumber if homeNumber
        xml.mmlAd :town, town if town
        xml.mmlAd :city, city if city
        xml.mmlAd :prefecture, prefecture if prefecture
        xml.mmlAd :full, full if full
        xml.mmlAd :zip, zip if zip
        xml.mmlAd :countryCode, countryCode if countryCode
      end
    end
  end

  class Phone < Base
    optional_attribute :telEquipType, :area, :city, :number, :extension, :full, :country, :memo

    def to_xml
      attributes = {'mmlPh:telEquipType' => telEquipType} if telEquipType
      xml.mmlPh :Phone, attributes do
        xml.mmlPh :area, area if area
        xml.mmlPh :city, city if city
        xml.mmlPh :number, number if number
        xml.mmlPh :extension, extension if extension
        xml.mmlPh :full, full if full
        xml.mmlPh :country, country if country
        xml.mmlPh :memo, memo if memo
      end
    end
  end

  class Facility < Base
    mandatory_attribute :name
    optional_attribute :id

    def to_xml
      xml.mmlFc :Facility do
        name.each do |n|
          attributes = {'mmlFc:repCode' => n.repCode}
          attributes['mmlFc:tableId'] = n.tableId if n.tableId
          xml.mmlFc :name, n.value, attributes
        end
        xml << id.to_xml if id
      end
    end
  end

  class Department < Facility

    def to_xml
      xml.mmlDp :Department do
        name.each do |n|
          attributes = { 'mmlDp:repCode' => n.repCode}
          attributes['mmlDp:tableId'] = n.tableId if n.tableId
          xml.mmlDp :name, n.value, attributes
        end
        xml << id.to_xml if id
      end
    end
  end

  class PersonalizedInfo < Base
    mandatory_attribute :id, :personName
    optional_attribute :facility, :department, :addresses, :emailAddresses, :phones

    def to_xml
      xml.mmlPsi :PersonalizedInfo do
        xml << id.to_xml
        xml.mmlPsi :personName do
          personName.each do |n|
            xml << n.to_xml
          end
        end
        xml << facility.to_xml if facility
        xml << department.to_xml if department
        xml.mmlPsi :addresses do
          addresses.each do |address|
            xml << address.to_xml
          end
        end if addresses
        xml.mmlPsi :emailAddresses do
          emailAddresses.each do |email|
            xml.mmlCm :email, email
          end
        end if emailAddresses
        xml.mmlPsi :phones do
          phones.each do |phone|
            xml << phone.to_xml
          end
        end if phones
      end
    end
  end

  class CreatorLicense < Base
    optional_attribute :tableId, :value
  end

  class CreatorInfo < Base
    mandatory_attribute :personalizedInfo, :creatorLicense

    def to_xml
      xml.mmlCi :CreatorInfo do
        xml << personalizedInfo.to_xml
        creatorLicense.each do |license|
          attributes = {'mmlCi:tableId' => license.tableId} if license.tableId
          xml.mmlCi :creatorLicense, license.value, attributes
        end
      end
    end
  end
end
