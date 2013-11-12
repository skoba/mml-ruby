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
end
