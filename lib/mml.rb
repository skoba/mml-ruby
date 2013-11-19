require 'builder'

module MML
  MML_NAMESPACE = 'xmlns:mml="http://www.medxml.net/MML"'

  class Base
    def namespace
      MML_NAMESPACE
    end

    def to_xml
      
    end
  end

  class V2Base < Base
    VERSION = '2.3'
  end


  class BaseName
    attr_reader :value, :repCode
    attr_accessor :tableId

    def initialize(args ={})
      %W(value repCode tableId).each do |item|
        self.send("#{item}=", args[item.to_sym])
      end      
    end

    def value=(value)
      raise ArgumentError, 'value is mandatory' if value.nil?
      @value = value
    end

    def repCode=(repCode)
      raise ArgumentError, 'repCode is mandatory' if repCode.nil?
      @repCode = repCode
    end
  end

  class FacilityName < BaseName

  end

  class DepartmentName < BaseName

  end

  class Name < BaseName
    attr_accessor :family, :given, :middle, :fullname, :prefix, :degree

    def initialize(args = {})
      %W(family given middle fullname prefix degree repCode tableId).each do |item|
        self.send("#{item}=", args[item.to_sym])
      end
    end

    undef value=

    def to_xml
      xb = Builder::XmlMarkup.new
      xb.mmlNm(:Name, {'mmlNm:repCode' => @repCode, 'mmlNm:tableId' => @tableId}) do
        xb.mmlNm :family, @family if @family
        xb.mmlNm :middle, @middle if @middle
        xb.mmlNm :given, @given if @given
        xb.mmlNm :fullname, @fullname if @fullname
        xb.mmlNm :prefix, @prefix if @prefix
        xb.mmlNm :degree, @degree if @degree
      end
    end
  end

  class Id
    attr_reader :value, :type, :tableId
    attr_accessor :checkDigit, :checkDigitSchema

    def initialize(args = {})
      self.value = args[:value]
      self.type = args[:type]
      self.tableId = args[:tableId]
      self.checkDigit = args[:checkDigit]
      self.checkDigitSchema = args[:checkDigitSchema]
    end

    def value=(value)
      raise ArgumentError, 'value should not be nil' if value.nil? or value.empty?
      @value = value
    end

    def type=(type)
      raise ArgumentError, 'type should no be nil' if type.nil? or type.empty?
      @type = type
    end

    def tableId=(tableId)
      raise ArgumentError, 'table id is required' if tableId.nil? or type.empty?
      @tableId = tableId
    end

    def to_xml
      xb = Builder::XmlMarkup.new
      attributes = {'mmlCm:type' => type, 'mmlCm:tableId' => tableId }
      attributes['mmlCm:checkDigit'] = checkDigit if checkDigit
      attributes['mmlCm:checkDigitSchema'] = checkDigitSchema if checkDigitSchema
      xb.mmlCm :Id,  value, attributes
    end
  end

  class ExtRef
    attr_accessor :contentType, :medicalRole, :title
    attr_reader :href

    def initialize(args = {})
      self.contentType = args[:contentType]
      self.medicalRole = args[:medicalRole]
      self.title = args[:title]
      self.href = args[:href]
    end

    def href=(href)
      raise ArgumentError, 'href is mandatory' if href.nil?
      @href = href
    end

    def to_xml
      xb = Builder::XmlMarkup.new
      attributes = { 'mmlCm:href' => href }
      attributes['mmlCm:contentType'] = contentType if contentType
      attributes['mmlCm:medicalRole'] = medicalRole if medicalRole
      attributes['mmlCm:title'] = title if title
      xb.mmlCm :extRef, attributes
    end
  end

  class Address
    attr_reader :repCode
    attr_accessor :addressClass, :tableId, :homeNumber, :town, :city, :prefecture, :full, :zip, :countryCode

    def initialize(args = {})
      %W(repCode addressClass tableId full homeNumber town city prefecture zip countryCode).each do |item|
        self.send("#{item}=", args[item.to_sym])
      end
    end

    def repCode=(repCode)
      raise ArgumentError, 'repCode is mandatory' if repCode.nil?
      @repCode = repCode
    end

    def to_xml
      xb = Builder::XmlMarkup.new
      attributes = { 'mmlAd:repCode' => repCode }
      attributes['mmlAd:addressClass'] = addressClass
      attributes['mmlAd:tableId'] = tableId
      xb.mmlAd :Address, attributes do
        xb.mmlAd :homeNumber, homeNumber if homeNumber
        xb.mmlAd :town, town if town
        xb.mmlAd :city, city if city
        xb.mmlAd :prefecture, prefecture if prefecture
        xb.mmlAd :full, full if full
        xb.mmlAd :zip, zip if zip
        xb.mmlAd :countryCode, countryCode if countryCode
      end
    end
  end

  class Phone
    attr_accessor :telEquipType, :area, :city, :number, :extension, :country, :memo

    def initialize(args = {})
      %W(telEquipType area city number extension country memo).each do |item|
        self.send("#{item}=", args[item.to_sym])
      end
    end

    def to_xml
      xb = Builder::XmlMarkup.new
      attributes = {'mmlPh:telEquipType' => telEquipType} if telEquipType
      xb.mmlPh :Phone, attributes do
        xb.mmlPh :area, area if area
        xb.mmlPh :city, city if city
        xb.mmlPh :number, number if number
        xb.mmlPh :extension, extension if extension
        xb.mmlPh :country, country if country
        xb.mmlPh :memo, memo if memo
      end
    end
  end

  class Facility
    attr_reader :name
    attr_accessor :id

    def initialize(args = {})
      %W(name id).each do |item|
        self.send("#{item}=", args[item.to_sym])
      end
    end

    def name=(name)
      raise ArgumentError, 'name is mandatory' if name.nil? or name.empty?
      @name = name
    end

    def to_xml
      xb = Builder::XmlMarkup.new
      xb.mmlFc :Facility do
        name.each do |n|
          attributes = {'mmlFc:repCode' => n.repCode}
          attributes['mmlFc:tableId'] = n.tableId if n.tableId
          xb.mmlFc :name, n.value, attributes
        end
        xb << id.to_xml if id
      end
    end
  end

  class Department < Facility
    def initialize(args = {})
      super
    end

    def to_xml
      xb = Builder::XmlMarkup.new
      xb.mmlDp :Department do
        name.each do |n|
          attributes = { 'mmlDp:repCode' => n.repCode}
          attributes['mmlDp:tableId'] = n.tableId if n.tableId
          xb.mmlDp :name, n.value, attributes
        end
        xb << id.to_xml if id
      end
    end
  end

  class PersonalizedInfo
    attr_reader :id, :personName
    attr_accessor :facility, :department, :addresses, :emailAddresses, :phones

    def initialize(args = {})
      %W(id personName facility department addresses emailAddresses phones).each do |item|
        send "#{item}=", args[item.to_sym]
      end
    end

    def id=(id)
      @id = id
    end

    def personName=(personName)
      @personName = personName
    end

    def to_xml
      xb = Builder::XmlMarkup.new
      xb.mmlPsi :PersonalizedInfo do
        xb << id.to_xml
        xb.mmlPsi :personName do
          personName.each do |n|
            xb << n.to_xml
          end
        end
        xb << facility.to_xml if facility
        xb << department.to_xml if department
        xb.mmlPsi :addresses do
          addresses.each do |address|
            xb << address.to_xml
          end
        end if addresses
        xb.mmlPsi :emailAddresses do
          emailAddresses.each do |email|
            xb.mmlCm :email, email
          end
        end if emailAddresses
        xb.mmlPsi :phones do
          phones.each do |phone|
            xb << phone.to_xml
          end
        end if phones
      end
    end
  end

  class CreatorLicense
    attr_accessor :tableId, :value

    def initialize(args = {})
      @tableId = args[:tableId]
      @value = args[:value]
    end
  end

  class CreatorInfo
    attr_reader :personalizedInfo, :creatorLicense

    def initialize(args = {})
      self.personalizedInfo = args[:personalizedInfo]
      self.creatorLicense = args[:creatorLicense]
    end

    def personalizedInfo=(personalizedInfo)
      raise ArgumentError, 'personalizedInfo is mandatory' if personalizedInfo.nil?
      @personalizedInfo = personalizedInfo
    end

    def creatorLicense=(creatorLicense)
      raise ArgumentError, 'creatorLicense is mandatory' if creatorLicense.nil? or creatorLicense.empty?
      @creatorLicense = creatorLicense
    end

    def to_xml
      xb= Builder::XmlMarkup.new
      xb.mmlCi :CreatorInfo do
        xb << personalizedInfo.to_xml
        creatorLicense.each do |license|
          attributes = {'mmlCi:tableId' => license.tableId} if license.tableId
          xb.mmlCi :creatorLicense, license.value, attributes
        end
      end
    end
  end
end
