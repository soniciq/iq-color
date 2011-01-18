module IQ # :nodoc:
  module Color
    # Returns a new instance based on the CSS3 color string supplied. Accepts
    # both hex and 'rgb' notation e.g. <tt>'#fed'</tt>, <tt>'#ffeedd'</tt> and
    # <tt>'rgb(255,238,221)'</tt> (note that white space is allowed either side
    # of the commas). For both color notation formats, an IQ::Color:RGB
    # instance is returned.
    # 
    # In addition to the standard rgb notations above, the <tt>'rgba'</tt>
    # notation can be supplied where 'a' is the alpha channel value between 0
    # and 1 (0 is fully transparent and 1 is fully opaque). In this case a new
    # IQ::Color::RGBA instance is returned.
    # 
    # A value of <tt>'transparent'</tt> may be supplied as a shortcut for
    # <tt>rgba(0,0,0,0)</tt> which will return a new IQ::Color::RGBA instance.
    # 
    # More on CSS3 colour strings can be found at:
    # http://www.w3.org/TR/css3-color
    # 
    def self.from_css(css_string)
      raise ArgumentError, 'Must supply a string' unless css_string.is_a?(String)
      
      if css_string[0, 1] == '#' || css_string.match(/^rgb\(.*\)$/)
        # RGB notations e.g. '#f00', '#ff0000' or 'rgb(n,n,n)'.
        IQ::Color::RGB.from_css css_string
      elsif css_string.match(/^rgba\(.*\)$/) || css_string == 'transparent'
        # RGBA notation e.g. 'rgba(n,n,n,n)' or 'transparent' string.
        IQ::Color::RGBA.from_css css_string
      else
        raise ArgumentError, 'Unrecognised CSS colour format'
      end
    end

    autoload :Base, File.join(File.dirname(__FILE__), 'color', 'base')
    autoload :RGB,  File.join(File.dirname(__FILE__), 'color', 'rgb')
    autoload :RGBA, File.join(File.dirname(__FILE__), 'color', 'rgba')
  end
end
