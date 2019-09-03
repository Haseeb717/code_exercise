require File.join(File.dirname(__FILE__), 'job')
require File.join(File.dirname(__FILE__), 'sequence')
require 'test/unit'

class SequenceTest < Test::Unit::TestCase

  # Scenario 1- if input == ""
  # This scenarion should return empty sequence.
  def test_returns_empty_string_if_no_jobs
    sequence = Sequence.new()
    sequence.add("")
    assert sequence.ordered.empty?
  end

  #  Scenario 2- if input == "a =>"
  # This scenario should return a sequence with single job.
  
  def test_returns_single_job_string_if_contains_one_job
    sequence = Sequence.new()
    sequence.add("a =>")
    assert_equal 1, sequence.ordered.size
    assert_equal 'a', sequence.ordered.first
  end

  # Scenario 3- if input == "a =>
  #                      b => c
  #                      c =>"
  # This scenario should return a sequence with all jobs and c will be placed before b.
  def test_retuns_job_in_a_specific_order_if_only_one_has_dependency
    sequence = Sequence.new()
    sequence.add("a =>
               b => c
               c =>")
    sequence.ordered.each do |job|
      assert (%w[a b c].include?(job))
    end
    assert sequence.ordered.index("c") < sequence.ordered.index("b")
  end

end
