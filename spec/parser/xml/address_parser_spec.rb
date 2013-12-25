require_relative 'xml_parser_spec_helper'

describe MML::Parser::XmlParser do
  let(:parser) {MML::Parser::XmlParser.new(sample_file_stream('address.mml'))}

  it 'is an instance of MML::Parser::XmlParser' do
    expect(parser).to be_an_instance_of MML::Parser::XmlParser
  end

  context 'parser parse method returns address instance' do
    let(:address) {parser.parse}

    it 'repCode is A' do
      expect(address.repCode).to eq 'A'
    end
  end
end
