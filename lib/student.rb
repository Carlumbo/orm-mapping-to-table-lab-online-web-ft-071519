<<<<<<< HEAD
class Student
attr_accessor :name, :grade 
attr_reader :id 
#build atrributes 

  def initialize(name, grade, id = nil )
    @name = name 
    @grade = grade 
    @id = id 
  end 
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  # build an initliaze with values of the table you are trying to create as it intializes
  # Set id to equal nil
  
  def self.create_table 
    sql = <<-SQL 
    CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT, grade INTEGER)
     SQL
     DB[:conn].execute(sql)
   end 
   # you are using the code to ceeate a table now, you use the heredoc syntac to create a multi line string" 
   # you set the sql = to the heredoc string 
   # use DB[:conn].execute(sql) to make the connection to the database 
   
   
   def self.drop_table
     sql= <<-SQL 
     DROP TABLE students 
    SQL
    DB[:conn].execute(sql)
   end
   
    def save	
    sql = <<-SQL	   
      INSERT INTO students (name, grade) 	VALUES (?, ?)	
       SQL
       
    DB[:conn].execute(sql, self.name, self.grade)	  
    @id = DB[:conn].execute("SELECT Last_insert_rowid() FROM students")[0][0]
  end
     #Note on this one
     # you are saying @id will be set equal to the primary key of the last insert into the table, you use two arrays starting out at zero here. 
  
  def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student
  end 
  # this combines the create_table, and save into one instance.
end
=======
class Student
attr_accessor :name, :grade 
attr_reader :id 

  def initialize(name, grade, id = nil )
    @name = name 
    @grade = grade 
    @id = id 
  end 
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
  def self.create_table 
    sql = <<-SQL 
    CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT, grade INTEGER)
     SQL
     DB[:conn].execute(sql)
   end 
   
   def self.drop_table
     sql= <<-SQL 
     DROP TABLE students 
    SQL
    DB[:conn].execute(sql)
   end
   
   def save
    sql = <<-SQL
      INSERT INTO students (name, grade)
        VALUES (?, ?)
    SQL

     DB[:conn].execute(sql, self.name, self.grade)
  end 
  
end
>>>>>>> 62ff149f8a3b5203f287f1688d57e6fed10d5d24
