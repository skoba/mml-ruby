      xml.mmlDp :Department do
        name.each do |n|
          attributes = { 'mmlDp:repCode' => n.repCode}
          attributes['mmlDp:tableId'] = n.tableId if n.tableId
          xml.mmlDp :name, n.value, attributes
        end
        xml << id.to_xml if id
      end
