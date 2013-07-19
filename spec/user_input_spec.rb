require_relative '../user_input'
require_relative '../resume_data'

describe UserInput do
  let(:resume_data) { ResumeData.new }
  let(:user_input)  { UserInput.new(resume_data) }
  describe "initialize method" do
    it "should accept resume_data method and assign" do
      user_input.resume_data.should == resume_data
    end
  end
  it "should read user input and assign data" do
    user_name = "Yedhu"
    user_age = 22
    user_nation = "India"
    user_dob = "3-Jan-1991"
    user_mob = "09008976026"
    user_input.stub(:get_data).with("Name : ").and_return(user_name)
    user_input.stub(:get_data).with("Age : ").and_return(user_age)
    user_input.stub(:get_data).with("Nation : ").and_return(user_nation)
    user_input.stub(:get_data).with("DOB : ").and_return(user_dob)
    user_input.stub(:get_data).with("Mob : ").and_return(user_mob)
    user_input.read
    user_input.resume_data.name.should == user_name
    user_input.resume_data.age.should == user_age
    user_input.resume_data.nation.should == user_nation
    user_input.resume_data.dob.should == user_dob
    user_input.resume_data.mob.should == user_mob
  end
end
