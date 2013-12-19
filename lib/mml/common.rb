require 'builder'

module MML
  require_relative '../mml'

  class BaseName < Base
    mandatory_attribute :value, :repCode
    optional_attribute :tableId
  end

  class FacilityName < BaseName

  end

  class DepartmentName < BaseName

  end

  class Name < BaseName
    optional_attribute :family, :given, :middle, :fullname, :prefix, :degree

    undef value=
  end

  class Id < Base
    mandatory_attribute :value, :type, :tableId
    optional_attribute :checkDigit, :checkDigitSchema
  end

  class ExtRef < Base
    mandatory_attribute :href
    optional_attribute :contentType, :medicalRole, :title
  end

  class Address < Base
    mandatory_attribute :repCode
    optional_attribute :addressClass, :tableId, :homeNumber, :town, :city, :prefecture, :full, :zip, :countryCode
  end

  class Phone < Base
    optional_attribute :telEquipType, :area, :city, :number, :extension, :full, :country, :memo
  end

  class Facility < Base
    mandatory_attribute :name
    optional_attribute :id
  end

  class Department < Facility

  end

  class PersonalizedInfo < Base
    mandatory_attribute :id, :personName
    optional_attribute :facility, :department, :addresses, :emailAddresses, :phones
  end

  class CreatorLicense < Base
    optional_attribute :tableId, :value
  end

  class CreatorInfo < Base
    mandatory_attribute :personalizedInfo, :creatorLicense
  end
end
