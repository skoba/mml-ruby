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

  end
end
