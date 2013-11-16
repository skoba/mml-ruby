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

  class CreatorInfo
    attr_accessor :creatorLicense, :tableId

    def initialize(args = {})
      @creatorLicense = args[:creatorLicense]
      @tableId = args[:tableId]
    end
  end

  class CreatorLicense
    attr_accessor :tableId, :value

    def initialize(args = {})
      @tableId = args[:tableId]
      @value = args[:value]
    end
  end

  class PersonalizedInfo
    
  end

  class Name
    attr_reader :repCode
    attr_accessor :tableId, :family, :given, :middle, :fullname, :prefix, :degree

    def initialize(args = {})
      @tableId = args[:tableId]
      self.repCode = args[:repCode]
      @family = args[:family]
      @given = args[:given]
      @middle = args[:middle]
      @fullname = args[:fullname]
      @prefix = args[:prefix]
      @degree = args[:degree]
    end

    def repCode=(repCode)
      raise ArgumentError, 'repCode is nil' if repCode.nil?
      @repCode = repCode
    end

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
    attr_accessor :equipType, :area, :city, :number, :extension, :country, :memo

    def initialize(args = {})
      %W(equipType area city number extension country memo).each do |item|
        self.send("#{item}=", args[item.to_sym])
      end
    end

    def to_xml
      xb = Builder::XmlMarkup.new
      attributes = {'mmlPh:equipType' => equipType} if equipType
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
end
