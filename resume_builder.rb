$: << '.'

require 'resume_data'
require 'user_input'
require 'active_support/core_ext'

class ResumeBuilder
  attr_reader :user_choice, :extension_list, :file_list

  def build
    user_input = UserInput.new(ResumeData.new)
    user_input.read
    self.load_generator_list
    begin
      print "Available Extensions : "
      p @extension_list
      self.read_choice
      self.load_class    
      user_class = "#{@user_choice.capitalize}Generator"
      user_class.constantize.new(user_input.resume_data).write_data_to_file
    rescue
      puts "Extension not available!"
    end
  end
  
  def read_choice
    @user_choice = get_choice("Prefered Output Extension : ")
  end
  
  def get_choice(user_message)
    print user_message
    gets.chomp
  end
  
  def load_class
    require @file_list[@extension_list.index(@user_choice)]
  end
  
  def load_generator_list
    @file_list = []
    @extension_list = []
    Dir.glob("generators/*.rb").each do |file|
      @file_list << file.sub(/\.rb/, "")
      extension = file.sub(/_.*/, "")
      @extension_list << extension.sub(/.*\//, "")
    end
  end
end
