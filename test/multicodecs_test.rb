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

  def test_it_can_fetch_by_code
    assert_equal Multicodecs.fetch_by!(code: 0).name, 'identity'
  end

  def test_it_can_fetch_by_name
    assert_equal Multicodecs.fetch_by!(name: 'identity').code, 0
  end

  def test_it_raises_keyerror_on_unfound_fetch
    assert_raises KeyError do
      Multicodecs.fetch_by!(name: '__always-raise__')
    end
  end

  def test_it_can_find_by_code
    assert_equal Multicodecs.find_by(code: 0).name, 'identity'
  end

  def test_it_can_find_by_name
    assert_equal Multicodecs.find_by(name: 'identity').code, 0
  end

  def test_it_does_not_raise_keyerror_on_unfound_find
    assert_nil Multicodecs.find_by(name: '__always-raise__')
  end

  def test_it_can_select_codecs_per_tag
    assert Multicodecs.codes.length > Multicodecs.where(tag: 'multihash').length
    refute_empty Multicodecs.where(tag: 'multihash')
    Multicodecs.each(tag: 'multihash') do |codec|
      assert codec.tag, 'multihash'
    end
  end
end
