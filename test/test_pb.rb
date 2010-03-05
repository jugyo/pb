require 'helper'
require 'stringio'

include PB
class TestPb < Test::Unit::TestCase

  should 'copy text to clipboard' do
    PB.copy('foo')
    assert_equal('foo', PB.read)
  end

  should 'be called module methods' do
    mock(PB).copy('foo')
    pbcopy('foo')

    mock(PB).read
    pbread

    mock(PB).paste
    pbpaste
  end

  context 'mock $stdout' do
    setup do
      @io = StringIO.new
      $stdout = @io
    end

    should 'paste to stdout' do
      PB.copy('foo')
      PB.paste
      @io.rewind
      assert_equal("foo\n", @io.read)
    end

    teardown do
      $stdout = STDOUT
    end
  end
end
