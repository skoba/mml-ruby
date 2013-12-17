      attributes = {'mmlNm:repCode' => repCode}
      attributes[:tableId] = tableId if tableId
      xml.mmlNm(:Name, attributes) do
        xml.mmlNm :family, @family if @family
        xml.mmlNm :middle, @middle if @middle
        xml.mmlNm :given, @given if @given
        xml.mmlNm :fullname, @fullname if @fullname
        xml.mmlNm :prefix, @prefix if @prefix
        xml.mmlNm :degree, @degree if @degree
      end
