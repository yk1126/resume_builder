require_relative '../resume_builder'

describe ResumeBuilder do
  let(:resume_builder) { ResumeBuilder.new }

  it "should create non-empty extension_list and file_list" do
    resume_builder.load_generator_list
    resume_builder.extension_list.should_not be_empty
    resume_builder.file_list.should_not be_empty
  end

  it "should contain all the generator files in directory" do
    list_of_files = Dir.glob("generators/*.rb")
    resume_builder.load_generator_list
    resume_builder.file_list.size.should == list_of_files.size
  end
  
  describe "should generate" do
    it "CSV if the user choice is 1" do
      choice = "csv"
      resume_builder.stub(:get_choice).with("Prefered Output Extension : ").and_return(choice)
      resume_builder.load_generator_list
      resume_builder.read_choice
      resume_builder.load_class
      resume_builder.user_choice.should == choice
      UserInput.any_instance.should_receive(:read)
      CsvGenerator.any_instance.should_receive(:write_data_to_file)
      resume_builder.build
    end

    it "PDF if the user choice is 2" do
      choice = "pdf"
      resume_builder.stub(:get_choice).with("Prefered Output Extension : ").and_return(choice)
      resume_builder.load_generator_list
      resume_builder.read_choice
      resume_builder.load_class
      resume_builder.user_choice.should == choice
      UserInput.any_instance.should_receive(:read)
      PdfGenerator.any_instance.should_receive(:write_data_to_file)
      resume_builder.build
    end
  end
end
