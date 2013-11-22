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

    private
    def xml
      @xml ||= Builder::XmlMarkup.new
    end

    def nil_check(value)
      raise ArgumentError, "#{caller} mandatory" if value.nil?
    end
    def blank_check(value)
      raise ArgumentError, "#{caller} mandatory" if value.nil? or value.empty?
    end
  end

  class V2Base < Base
    MML_VERSION = '2.3'
  end

  class PatientInfo < Base
    attr_reader :masterId, :personName, :birthday, :sex
    attr_accessor :otherId, :nationality, :marital, :addresses, :emailAddresses, :phones, :accountNumber, :socialIdentification, :death

    def masterId=(masterId)
      raise ArgumentError, 'masterId is mandatory' if masterId.nil?
      @masterId = masterId
    end

    def personName=(personName)
      raise ArgumentError, 'personName is mandatory' if personName.nil? or personName.empty?
      @personName = personName
    end

    def birthday=(birthday)
      raise ArgumentError, 'birthday is mandatory' if birthday.nil?
      @birthday = birthday
    end

    def sex=(sex)
      @sex = sex
    end

    def to_xml
      xml.mmlPi :PatientModule do
        xml.mmlPi :uniqueInfo do
          xml.mmlPi :masterId do
            xml << masterId.to_xml
          end
          otherId.each do |item|
            xml.mmlPi(:otherId, {'mmlPi:type' => item.type}) do            
              xml << item.id.to_xml
            end
          end if otherId
        end
      end
    end
  end

  class OtherId < Base
    attr_reader :id, :type

    def id=(id)
      nil_check id
      @id = id
    end

    def type=(type)
      blank_check type
      @type=type
    end
  end

  class Nationality
    attr_reader :value
    attr_accessor :subtype

    def initialize(args)
      args.keys.each do |item|
        send "#{item.to_s}=", args[item]
      end      
    end

    def value=(value)
      raise ArgumentError if value.nil?
      @value=value
    end
  end

  class Death
    attr_reader :flag
    attr_accessor :date

    def initialize(args)
      args.keys.each do |item|
        send "#{item.to_s}=", args[item]
      end
    end

    def flag=(flag)
      @flag = flag
    end
  end

  require_relative 'mml/common'
  require_relative 'mml/version'
end
