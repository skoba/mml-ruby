      xml.mmlPc :ProgressCourseModule do
        xml.mmlPc :FreeExpression do
          xml << freeExpression
          extRef.each do |ref|
            xml << ref.to_xml
          end if extRef
        end if freeExpression
        xml.mmlPc :structuredExpression do
          structuredExpression.each do |item|
            xml.mmlPc :problemItem do
              attributes = Hash.new
              attributes = {'mmlPc:dxUid' => item.dxUid} if item.dxUid
              xml.mmlPc :problem, item.problem, attributes
              xml.mmlPc :subjective do
                xml.mmlPc :freeNotes, item.subjective.freeNotes if item.subjective.freeNotes
                xml.mmlPc :subjectiveItem do
                  item.subjective.subjectiveItem.each do |sitem|
                    xml.mmlPc :timeExpression, sitem.timeExpression
                    sitem.eventExpression.each do |event|
                      xml.mmlPc :eventExpression, event
                    end if sitem.eventExpression
                  end
                end if item.subjective.subjectiveItem
              end if item.subjective
              xml.mmlPc :objective do
                xml.mmlPc :objectiveNotes, item.objective.objectiveNotes if item.objective.objectiveNotes
                xml.mmlPc :physicalExam do
                  item.objective.physicalExam.each do |pitem|
                    xml.mmlPc :physicalExamItem do
                      xml.mmlPc :title, pitem.title
                      xml.mmlPc :result, pitem.result
                      xml.mmlPc :interpretation, pitem.interpretation if pitem.interpretation
                      xml.mmlPc :referenceInfo do
                        pitem.referenceInfo.each do |ref|
                          xml << ref.to_xml
                        end
                      end if pitem.referenceInfo
                    end
                  end
                end if item.objective.physicalExam
                xml.mmlPc :testResult do
                  xml << item.objective.testResult.value
                  item.objective.testResult.link.each do |ref|
                    xml << ref.to_xml
                  end if item.objective.testResult.link
                end if item.objective.testResult
                xml.mmlPc :rxRecord do
                  xml << item.objective.rxRecord.value
                  item.objective.rxRecord.link.each do |ref|
                    xml << ref.to_xml
                  end if item.objective.rxRecord.link
                end if item.objective.rxRecord
                xml.mmlPc :txRecord do
                  xml << item.objective.txRecord.value
                  item.objective.txRecord.link.each do |ref|
                    xml << ref.to_xml
                  end
                end if item.objective.txRecord
              end if item.objective
              xml.mmlPc :assessment do
                item.assessment.each do |aitem|
                  xml.mmlPc :assessmentItem, aitem
                end
              end if item.assessment
              xml.mmlPc :plan do
                xml.mmlPc :testOrder do
                  xml << item.plan.testOrder.value
                  item.plan.testOrder.link.each do |ref|
                    xml << ref.to_xml
                  end if item.plan.testOrder.link
                end if item.plan.testOrder
                xml.mmlPc :rxOrder do
                  xml << item.plan.rxOrder.value
                  item.plan.rxOrder.link.each do |ref|
                    xml << ref.to_xml
                  end if item.plan.rxOrder.link
                end if item.plan.rxOrder
                xml.mmlPc :txOrder do
                  xml << item.plan.txOrder.value
                  item.plan.txOrder.link.each do |ref|
                    xml << ref.to_xml
                  end if item.plan.txOrder.link
                end if item.plan.txOrder
                xml.mmlPc :planNotes, item.plan.planNotes
              end if item.plan
            end
          end
        end if structuredExpression
      end
