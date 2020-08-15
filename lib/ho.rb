# frozen_string_literal: true


Hoge = Proc.new { p :hoge }



class Foo
  def s
    p :foos
  end
  def r
    p :foor
  end
end

class Fuga < Foo
  def s
    p :fugas
    super
  end
  alias r s
end

module Bar
  def bar
  end
end

a = Fuga.new
def a.sin
end
Sin = a

class K
  def self.k
  end
end
