      xml.mmlFc :Facility do
        name.each do |n|
          attributes = {'mmlFc:repCode' => n.repCode}
          attributes['mmlFc:tableId'] = n.tableId if n.tableId
          xml.mmlFc :name, n.value, attributes
        end
        xml << id.to_xml if id
      end
