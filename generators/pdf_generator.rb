require 'prawn'

class PdfGenerator
  attr_reader :resume_data, :file_name
  def initialize(resume_data)
    @resume_data = resume_data
    @file_name = "Resume.pdf"
  end
  def write_data_to_file
    text_value = []
    @resume_data.data_fields.each do |data|
      text_value << "#{data[0]} : #{data[1]}\n"
    end
    Prawn::Document.generate(@file_name) do
      text_value.count.times { |i| text text_value[i] }
    end
  end
end
