# A class for representing RGB values.

class IQ::Color::RGB < IQ::Color::Base
  attr_reader :red, :green, :blue
  
  # Returns a new IQ::Color::RGB instance with the supplied rgb values.
  def initialize(red, green, blue)
    [red, green, blue].each do |color|
      raise ArgumentError, 'Color values must be supplied as integers' unless color.is_a?(Integer)
      raise ArgumentError, 'Color values must be in the range of 0-255' if color < 0 || color > 255
    end
    @red, @green, @blue = red, green, blue
  end
  
  # Returns the color as a css hex string e.g. <tt>'#ffeedd'</tt>.
  def to_css
    '#%02x%02x%02x' % [red, green, blue]
  end
  
  # Returns a new instance based on the css string supplied. Accepts both hex
  # and 'rgb' notation e.g. <tt>'#fed'</tt>, <tt>'#ffeedd'</tt> or
  # <tt>'rgb(255,238,221)'</tt> (note that white space is allowed either side
  # of the commas). More on CSS3 colour strings can be found at:
  # http://www.w3.org/TR/css3-color
  # 
  def self.from_css(css_string)
    raise ArgumentError, 'CSS color must be in the form of a string' unless css_string.is_a?(String)
    
    if css_string[0, 1] == '#'
      # hex notation e.g. '#fed' or '#ffeedd'
      hex = css_string[1..-1]
      colors = case hex.size 
        when 3 : hex.scan(/[0-9A-Fa-f]/).map { |channel| (channel * 2).to_i(16) }
        when 6 : hex.scan(/[0-9A-Fa-f]{2}/).map { |channel| channel.to_i(16) }
        else raise(ArgumentError, 'Hex colour must be in the format of "#fed" or "#ffeedd"')
      end
      new *colors
    elsif match = css_string.match(/^rgb\(#{COLOR_MATCH},#{COLOR_MATCH},#{COLOR_MATCH}\)$/)
      # 'rgb(n,n,n)' notation
      new _flatten_percentage(match[1]), _flatten_percentage(match[2]), _flatten_percentage(match[3])
    else
      raise ArgumentError, 'Unrecognised colour format'
    end
  end
  
  class << self
    private
  
    def _flatten_percentage(percentage_string)
      percentage_string[-1, 1] == '%' ? ((percentage_string.chomp('%').to_f * 256) / 100).round : percentage_string.to_i
    end
  end
end