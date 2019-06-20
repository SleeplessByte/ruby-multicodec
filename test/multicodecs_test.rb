require 'test_helper'

class MulticodecsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Multicodecs::VERSION
  end

  def test_it_registers_the_codecs
    refute_nil Multicodecs['identity']
    assert_equal Multicodecs['identity'].code, 0

    refute_nil Multicodecs[20]
    assert_equal Multicodecs[20].name, 'sha3-512'
  end
end
