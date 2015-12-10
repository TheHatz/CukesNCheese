When(/^I open my shows xml file$/) do
  xml_file = File.open('shows.xml')
  @xml_doc = Nokogiri::XML(xml_file)
  xml_file.close

end

Then(/^I should see (\d+) sitcoms$/) do   |num|
  sitcoms = @xml_doc.xpath('//sitcom')
  sitcoms.length.should == num.to_i

end

And(/^I should see (\d+) drama$/) do   |num|
  sitcoms = @xml_doc.xpath('//drama')
  sitcoms.length.should == num.to_i
end


Given(/^I create XML for these phone book entries:$/) do |phone_book|
  builder = Builder::XmlMarkup.new
  @xml = builder.contacts do |contacts|
    phone_book.hashes.each do  |row|
      contacts.contact do |contact|
        contact.name row ['name']
        contact.phone row ['phone']
      end
    end
  end
end


When(/^I look up the entry for "(.*?)"$/) do |name|
  xml_doc = Nokogiri::XML(@xml)
  contacts = xml_doc.xpath('//contact')
  @node = contacts.find {
      |row| row.content.include? name
  }
end


Then(/^I see the phone number "(.*?)"$/) do |phone_num|
  @node.at_xpath('.//phone').content.should == phone_num

end