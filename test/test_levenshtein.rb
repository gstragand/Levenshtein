$LEVENSHTEIN_LIB = File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << $LEVENSHTEIN_LIB
require 'test/unit'
require 'Levenshtein.rb'

class Test_levenshtein < Test::Unit::TestCase

  def test_levenshtein
    @l = Levenshtein.new

    compare = @l.compare("George", "George")
    assert_equal compare, 1.0, "Expected match"

    compare = @l.compare("George", "Geordie")
    assert compare > Float(0.710), "Too low"
    assert compare < Float(0.720), "Too high"

    compare = @l.compare("kitten", "sitting")
    assert compare > Float(0.570), "Too low"
    assert compare < Float(0.5720), "Too high"
  end

end