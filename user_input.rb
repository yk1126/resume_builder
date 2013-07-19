class UserInput
  attr_accessor :resume_data
  def initialize(resume_data)
    @resume_data = resume_data
  end
  def read
    @resume_data.name = get_data("Name : ")
    @resume_data.age = get_data("Age : ")
    @resume_data.nation = get_data("Nation : ")
    @resume_data.dob = get_data("DOB : ")
    @resume_data.mob = get_data("Mob : ")
  end
  def get_data(input_help_msg)
    print input_help_msg
    gets.chomp
  end
end
