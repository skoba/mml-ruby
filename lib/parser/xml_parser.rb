require 'nokogiri'

module MML
  module Parser
    class XmlParser
      def initialize(src)
        @xml = Nokogiri::XML(src)
      end

      def parse
        address(@xml.xpath('//mmlAd:Address'))
      end

      private
      def address(node)
        MML::Address.new(repCode: address_repCode(node), tableId: address_tableId(node), addressClass: address_Class(node), full: address_full(node), prefecture: address_prefecture(node), city: address_city(node), town: address_town(node), homeNumber: address_homeNumber(node), zip: address_zip(node), countryCode: address_countryCode(node))
      end

      def address_repCode(node)
        node.xpath('@mmlAd:repCode').text
      end

      def address_tableId(node)
        node.xpath('@mmlAd:tableId').text
      end

      def address_Class(node)
        node.xpath('@mmlAd:addressClass').text
      end

      def address_full(node)
        node.xpath('mmlAd:full').text
      end

      def address_prefecture(node)
        node.xpath('mmlAd:prefecture').text
      end

      def address_city(node)
        node.xpath('mmlAd:city').text
      end

      def address_town(node)
        node.xpath('mmlAd:town').text
      end

      def address_homeNumber(node)
        node.xpath('mmlAd:homeNumber').text
      end

      def address_zip(node)
        node.xpath('mmlAd:zip').text
      end

      def address_countryCode(node)
        node.xpath('mmlAd:countryCode').text
      end
    end
  end
end
