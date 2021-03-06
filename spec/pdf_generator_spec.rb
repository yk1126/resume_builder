require_relative '../generators/pdf_generator'
require_relative '../resume_data'
require 'pdf/reader'

describe PdfGenerator do
  let(:resume_data) { ResumeData.new }
  let(:pdf_generator) { PdfGenerator.new(resume_data) }
  describe "initialize method" do
    it "should initialize object with ResumeData instance" do
      pdf_generator.resume_data.should == resume_data
      pdf_generator.file_name.should_not be_empty
    end
  end
  it "should write data to a PDF file" do
    pdf_generator.write_data_to_file
    File.size?(pdf_generator.file_name).should_not be_nil
  end
  it "should write correct data to file" do
    pdf_generator.write_data_to_file
    reader = PDF::Reader.new(pdf_generator.file_name)
    page = reader.page(1).text
    page.should include("Name")
    page.should include(resume_data.name.to_s)
    page.should include("Age")
    page.should include(resume_data.age.to_s)
    page.should include("DOB")
    page.should include(resume_data.dob.to_s)
  end
end
 
