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

  class PatientInfo
    attr_reader :masterId, :personName, :birthday, :sex
    attr_accessor :otherId

    def initialize(args = {})
      args.keys.each do |item|
        send "#{item.to_s}=", args[item]
      end
    end

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

  require_relative 'mml/common'
  require_relative 'mml/version'
end
