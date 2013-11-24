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
        xml.mmlPi :nationality, nationality.value, {'mmlPi:subtype' => nationality.subtype} if nationality
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

  class Race

  end

  class Insurance
    
  end

  require_relative 'mml/common'
  require_relative 'mml/version'
end
