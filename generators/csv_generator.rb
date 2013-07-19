require 'csv'

class CsvGenerator
  attr_reader :resume_data, :file_name
  def initialize(resume_data)
    @resume_data = resume_data
    @file_name = "Resume.csv"
  end
  def write_data_to_file
    resume_header = []
    resume_values = []
    resume_data.data_fields.each do |data|
      resume_header << data[0]
      resume_values << data[1]
    end
    CSV.open(@file_name, "w") do |csv|
      csv << resume_header 
      csv << resume_values
    end
  end
end
