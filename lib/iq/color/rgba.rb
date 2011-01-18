# A class for representing RGB values with an alpha channel.

class IQ::Color::RGBA < IQ::Color::RGB
  attr_reader :alpha
  
  # Returns a new IQ::Color::RGBA instance with the supplied rgb and alpha values.
  def initialize(red, green, blue, alpha = 1.0)
    raise ArgumentError, 'Alpha value must be an integer of float' unless alpha.is_a?(Integer) || alpha.is_a?(Float)
    raise ArgumentError, 'Alpha value must be between 0.0 and 1.0' if alpha < 0 || alpha > 1
    super red, green, blue
    @alpha = alpha.to_f
  end
  
  # Returns the color as a css rgba string e.g. <tt>'rgba(14,20,40,0.4)'</tt>.
  def to_css
    'rgba(%d,%d,%d,%s)' % [red, green, blue, alpha]
  end
  
  # Returns a new instance based on the css string supplied. Accepts hex, 'rgb'
  # and 'rgba' notation e.g. <tt>'#fed'</tt>, <tt>'#ffeedd'</tt>, 
  # <tt>'rgb(255,238,221)'</tt> and <tt>'rgb(255,238,221,1.0)'</tt>
  # (note that white space is allowed either side of the commas).
  # 
  # If an <tt>'rgba'</tt> string is supplied then the 'a' segment is the alpha
  # value between 0 and 1 (0 is fully transparent and 1 is fully opaque).
  # 
  # A value of <tt>'transparent'</tt> may be supplied as a shortcut for
  # <tt>rgba(0,0,0,0)</tt>.
  # 
  # More on CSS3 colour strings can be found at:
  # http://www.w3.org/TR/css3-color
  # 
  def self.from_css(css_string)
    if css_string == 'transparent'
      new 0, 0, 0, 0
    elsif match = css_string.match(/^rgba\(#{COLOR_MATCH},#{COLOR_MATCH},#{COLOR_MATCH},#{FLOAT_MATCH}\)$/)
      # 'rgba(n,n,n,n)' notation
      new _flatten_percentage(match[1]), _flatten_percentage(match[2]), _flatten_percentage(match[3]), match[4].to_f
    else
      super css_string
    end
  end
end