require File.join(File.dirname(__FILE__), '..', '..', 'helper')

class IQ::ColorTest < Test::Unit::TestCase
  context "from_css" do
    should "raise when given non string value" do
      not_a_string = stub
      not_a_string.stubs(:is_a?).with(String).returns(false)
      assert_raise(ArgumentError) { IQ::Color.from_css(not_a_string) }
    end
    
    should "delegate to rgb class for 3 digit hex values" do
      IQ::Color::RGB.stubs(:from_css).with('#fed').returns('from rgb class')
      assert_equal 'from rgb class', IQ::Color.from_css('#fed')
    end

    should "delegate to rgb class for 6 digit hex values" do
      IQ::Color::RGB.stubs(:from_css).with('#ffeedd').returns('from rgb class')
      assert_equal 'from rgb class', IQ::Color.from_css('#ffeedd')
    end

    should "delegate to rgb class for rgb notation" do
      IQ::Color::RGB.stubs(:from_css).with('rgb(1,2,3)').returns('from rgb class')
      assert_equal 'from rgb class', IQ::Color.from_css('rgb(1,2,3)')
    end

    should "delegate to rgba class for rgba notation" do
      IQ::Color::RGBA.stubs(:from_css).with('rgba(1,2,3,0.8)').returns('from rgba class')
      assert_equal 'from rgba class', IQ::Color.from_css('rgba(1,2,3,0.8)')
    end

    should "delegate to rgba class for transparent string" do
      IQ::Color::RGBA.stubs(:from_css).with('transparent').returns('from rgba class')
      assert_equal 'from rgba class', IQ::Color.from_css('transparent')
    end

    should "raise when unrecognised format" do
      assert_raise(ArgumentError) { IQ::Color.from_css('nonsense') }
    end
  end
end