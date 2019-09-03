class Job

  attr_accessor :character, :dependency

  # it will separate character and dependency using split like @character = "a" and @dependency = "b"

  def initialize(input)
    @character, @dependency = input.split(/ => ?/).map { |line| line.strip }
  end

  # Dependency check , if there is no dependency it will return true
  def has_dependency?
    return true unless @dependency.nil?
  end

end