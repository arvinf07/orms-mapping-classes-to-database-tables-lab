require 'pry'
require_relative '../config/environment'

class Student

  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end  

  def self.create_table
    sql = "CREATE TABLE students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade INTEGER);"

    DB[:conn].execute(sql)
  end  

  def self.drop_table
    sql = "DROP TABLE students"

    DB[:conn].execute(sql)
  end

  def save
    sql = "INSERT INTO students (name, grade) 
    VALUES (?,?)"
    DB[:conn].execute(sql, self.name, self.grade)

    @id = DB[:conn].last_insert_row_id
  end  

  # def self.create(attr_hash)
   
  #    new_obj = self.new(attr_hash[:name], attr_hash[:grade], DB[:conn].last_insert_row_id)
  #    binding.pry
  #    new_obj
  # end   
  def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student
  end


  # DB[:conn]  

  
end
