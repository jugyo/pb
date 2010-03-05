# == Usage:
#
#   require "pb"
#   pbcopy "foo"
#   pbread #=> "foo"
#
module PB
  def pbread
    PB.read
  end

  def pbcopy(stuff)
    PB.copy(stuff)
  end

  def pbpaste
    PB.paste
  end

  class << self
    def read
      IO.popen('pbpaste') {|clipboard| clipboard.read}
    end

    def copy(stuff)
      IO.popen('pbcopy', 'w+') {|clipboard| clipboard.write(stuff)}
    end

    def paste
      puts read
    end
  end
end

include PB
