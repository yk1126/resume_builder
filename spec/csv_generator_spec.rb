require_relative '../generators/csv_generator'
require_relative '../resume_data'

describe CsvGenerator do
  let(:resume_data) { ResumeData.new }
  let(:csv_generator) { CsvGenerator.new(resume_data) }
  describe "initialize method" do
    it "should initialize object with ResumeData instance" do
      csv_generator.resume_data.should == resume_data
      csv_generator.file_name.should_not be_empty
    end
  end
  it "should write data to a csv file" do
    csv_generator.write_data_to_file
    File.size?(csv_generator.file_name).should_not be_nil
  end
end
 
