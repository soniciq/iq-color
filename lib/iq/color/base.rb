# The base class that color model classes should inherit.
class IQ::Color::Base # :nodoc:
  COLOR_MATCH = /\s*(\d*\.?\d+\%?)\s*/
  FLOAT_MATCH = /\s*(\d*\.?\d+)\s*/
end