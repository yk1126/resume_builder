class ResumeData
  attr_accessor :name, :age, :nation, :dob, :mob
  def data_fields
	return {"Name" => @name, "Age" => @age, "Nation" => nation, "DOB" => @dob, "Mob" => @mob}
  end
end
