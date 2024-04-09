# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/bigdecimal/all/bigdecimal.rbi
#
# bigdecimal-3.1.7

class Integer < Numeric
  def to_d; end
end
class Float < Numeric
  def to_d(precision = nil); end
end
class String
  def to_d; end
end
class BigDecimal < Numeric
  def to_d; end
  def to_digits; end
end
class Rational < Numeric
  def to_d(precision); end
end
class Complex < Numeric
  def to_d(*args); end
end
class NilClass
  def to_d; end
end
