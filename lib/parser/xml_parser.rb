require 'nokogiri'

module MML
  module Parser
    class XmlParser
      def initialize(src)
        @xml = Nokogiri::XML(src)
      end

      def parse

      end
    end
  end
end
