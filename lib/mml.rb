require 'builder'

module MML
  MML_NAMESPACE = 'xmlns:mml="http://www.medxml.net/MML"'

  class Base
    def namespace
      MML_NAMESPACE
    end

    def to_xml
      @xb = Builder::XmlMarkup.new
    end
  end

  class V2Base < Base
    VERSION = '2.3'
  end

  require_relative 'mml/common'
  require_relative 'mml/version'
end
