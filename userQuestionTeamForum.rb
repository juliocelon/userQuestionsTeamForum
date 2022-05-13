# 5:32 pm

class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Question
  attr_accessor :question, :user
    def initialize(question, user)
    @question = question
    @user = user
  end
end

class Team
  attr_accessor :team

  def initialize
    self.team = []
  end
  
  def << (user)
    team << user.name.downcase
  end

  def ==(array)
    array.each do |element|
      if !team.include?(element.name.downcase)
        return false
      end
    end
    true
  end
end

class Forum
  attr_accessor :hash, :questions_of_team, :original_questions
    
  def initialize(questions)
    self.hash = {}
    self.questions_of_team = []
    self.original_questions = questions
    questions.each_with_index do |q, index|
      hash[q.question] = q.user.name.downcase
    end
  end

  def questions_by(team)

    users = team.team.each do |element|
        element
    end

    self.questions_of_team = []
    hash.each do |element|
        if (element & users).any?
           self.questions_of_team << element[0]
        end
    end

    final_questions_of_team = []
    self.original_questions.each do |element|
        if(self.questions_of_team.include?(element.question ))
            final_questions_of_team << element 
        end
    end
    final_questions_of_team
  end

end

#Primer ejercicio
david = User.new("David")
geovany = User.new("Geovany")
ariel = User.new("Ariel")

#p david.name == "David" # => true
#p geovany.name == "Geovany" # => true
#p ariel.name == "Ariel" # => true


#Segundo ejercicio
q1 = Question.new("Primera pregunta", david)
q2 = Question.new("Segunda pregunta", geovany)
q3 = Question.new("Tercera pregunta", ariel)
q4 = Question.new("Cuarta pregunta", ariel)
q5 = Question.new("Quinta pregunta", ariel)
q6 = Question.new("Sexta pregunta", david)

#p q1.question == "Primera pregunta" # => true
#p q1.user == david # => true

#Tercer ejercicio
team = Team.new
team << david
team << geovany
#p team == [david, geovany] # => true

team2 = Team.new
team2 << ariel
#p team2 == [ariel] # => true

#Cuarto ejercicio
forum = Forum.new([q1, q2, q3, q4, q5, q6])
forum.questions_by(team)
p forum.questions_by(team) == [q1, q2, q6] # => true
#p forum.questions_by(ariel) == [q3, q4, q5] # => true