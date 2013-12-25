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

    it 'tableId is MML0025' do
      expect(address.tableId).to eq 'MML0025'
    end

    it 'addressClass is business' do
      expect(address.addressClass).to eq 'business'
    end

    it 'full is 506, Dept. 9, Kyoto Research Park (KRP), Awata-cho 91, Chudoji, Shimogyo-ku, Kyoto-city' do
      expect(address.full).to eq '506, Dept. 9, Kyoto Research Park (KRP), Awata-cho 91, Chudoji, Shimogyo-ku, Kyoto-city'
    end

    it 'prefecture is Kyoto-fu' do
      expect(address.prefecture).to eq 'Kyoto-fu'
    end

    it 'city is Kyoto-city' do
      expect(address.city).to eq 'Kyoto-city'
    end

    it 'town is Awata-cho 91, Chudoji, Shimogyo-ku' do
      expect(address.town).to eq 'Awata-cho 91, Chudoji, Shimogyo-ku'
    end

    it 'homeNumber is 506, Dept. 9, Kyoto Research Park (KRP)' do
      expect(address.homeNumber).to eq '506, Dept. 9, Kyoto Research Park (KRP)'
    end

    it 'zip is 600-8815' do
      expect(address.zip).to eq '600-8815'
    end

    it 'countryCode is JPN' do
      expect(address.countryCode).to eq 'JPN'
    end
  end
end
