class School
  attr_accessor :roster

  def initialize
    @roster = {}
  end

  def to_h
    @roster.values.each { |name| name.sort!}
    @roster
  end

  def add(name,grade) 
    @roster[grade] = [] if !@roster[grade]
    @roster[grade] << name
  end

  def grade(_grade)
    return [] if !@roster.keys.include? _grade
    @roster[_grade]
  end
end

