require File.join(File.dirname(__FILE__), '..', '..', 'helper')

class IQ::Color::RGBTest < Test::Unit::TestCase
  context "class definition" do
    should "inherit from base class" do
      assert_equal IQ::Color::Base, IQ::Color::RGB.superclass
    end
  end

  context "instance methods" do
    context "initialize" do
      context "red" do
        should "raise when red value is not an integer" do
          not_an_integer = stub_everything
          not_an_integer.stubs(:is_a?).with(Integer).returns(false)
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGB.new(not_an_integer, mock_integer, mock_integer)
          end
        end

        should "raise when red value is greater than 255" do
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGB.new(256, mock_integer, mock_integer)
          end
        end

        should "raise when red value is less than zero" do
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGB.new(-1, mock_integer, mock_integer)
          end
        end

        should "store red value in instance variable" do
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_equal 123, IQ::Color::RGB.new(123, mock_integer, mock_integer).instance_variable_get('@red')
        end
      end
      
      context "green" do
        should "raise when green value is not an integer" do
          not_an_integer = stub_everything
          not_an_integer.stubs(:is_a?).with(Integer).returns(false)
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGB.new(mock_integer, not_an_integer, mock_integer)
          end
        end

        should "raise when green value is greater than 255" do
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGB.new(mock_integer, 256, mock_integer)
          end
        end

        should "raise when green value is less than zero" do
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGB.new(mock_integer, -1, mock_integer)
          end
        end

        should "store green value in instance variable" do
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_equal 123, IQ::Color::RGB.new(mock_integer, 123, mock_integer).instance_variable_get('@green')
        end
      end
      
      context "blue" do
        should "raise when blue value is not an integer" do
          not_an_integer = stub_everything
          not_an_integer.stubs(:is_a?).with(Integer).returns(false)
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGB.new(mock_integer, mock_integer, not_an_integer)
          end
        end

        should "raise when blue value is greater than 255" do
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGB.new(mock_integer, mock_integer, 256)
          end
        end

        should "raise when blue value is less than zero" do
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGB.new(mock_integer, mock_integer, -1)
          end
        end

        should "store blue value in instance variable" do
          mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_equal 123, IQ::Color::RGB.new(mock_integer, mock_integer, 123).instance_variable_get('@blue')
        end
      end
    end

    context "red" do
      should "return value of instance variable" do
        mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
        instance = IQ::Color::RGB.new(mock_integer, mock_integer, mock_integer)
        instance.instance_variable_set '@red', 'the red'
        assert_equal 'the red', instance.red
      end
    end
  
    context "green" do
      should "return value of instance variable" do
        mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
        instance = IQ::Color::RGB.new(mock_integer, mock_integer, mock_integer)
        instance.instance_variable_set '@green', 'the green'
        assert_equal 'the green', instance.green
      end
    end
  
    context "blue" do
      should "return value of instance variable" do
        mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
        instance = IQ::Color::RGB.new(mock_integer, mock_integer, mock_integer)
        instance.instance_variable_set '@blue', 'the blue'
        assert_equal 'the blue', instance.blue
      end
    end

    context "to_css" do
      should "return colour values as a six digit css hex string" do
        mock_integer = stub_everything(:is_a? => true, :< => false, :> => false)
        instance = IQ::Color::RGB.new(mock_integer, mock_integer, mock_integer)
        instance.stubs(:red).returns(254)
        instance.stubs(:green).returns(220)
        instance.stubs(:blue).returns(186)
        assert_equal '#fedcba', instance.to_css
      end
    end
    
    context "class methods" do
      context "from_css" do
        should "raise when argument is not a string" do
          not_a_string = stub_everything
          not_a_string.stubs(:is_a?).with(String).returns(false)
          assert_raise(ArgumentError) { IQ::Color::RGB.from_css(not_a_string) }
        end

        should "return new instance for 3 digit hex string" do
          klass = IQ::Color::RGB
          klass.stubs(:new).with(255, 238, 221).returns('the instance')
          assert_equal 'the instance', klass.from_css('#fed')
        end
    
        should "ignore case when returning new instance for 3 digit hex string" do
          klass = IQ::Color::RGB
          klass.stubs(:new).with(255, 238, 221).returns('the instance')
          assert_equal 'the instance', klass.from_css('#fED')
        end
    
        should "raise for malformed 3 digit hex string" do
          assert_raise(ArgumentError) { IQ::Color::RGB.from_css('#fzd') }
        end

        should "return new instance for 6 digit hex string" do
          klass = IQ::Color::RGB
          klass.stubs(:new).with(254, 220, 186).returns('the instance')
          assert_equal 'the instance', klass.from_css('#fedcba')
        end
    
        should "ignore case when returning new instance for 6 digit hex string" do
          klass = IQ::Color::RGB
          klass.stubs(:new).with(254, 220, 186).returns('the instance')
          assert_equal 'the instance', klass.from_css('#fedcba')
        end
    
        should "raise_for_malformed_6_digit_hex_string" do
          assert_raise(ArgumentError) { IQ::Color::RGB.from_css('#fzdcba') }
        end
    
        should "raise_given_hex_string_of_wrong_length" do
          assert_raise(ArgumentError) { IQ::Color::RGB.from_css('#febcdaf') }
        end

        should "return new instance for rgb notation string" do
          klass = IQ::Color::RGB
          klass.stubs(:new).with(254, 220, 186).returns('the instance')
          assert_equal 'the instance', klass.from_css('rgb(254,220,186)')
        end

        should "allow spaces before and after values in rgb notation string" do
          klass = IQ::Color::RGB
          klass.stubs(:new).with(254, 220, 186).returns('the instance')
          assert_equal 'the instance', klass.from_css('rgb(  254 ,  220   ,  186  )')
        end

        should "convert percentages in rgb notation to relevant rounded values" do
          klass = IQ::Color::RGB
          klass.stubs(:new).with(67, 38, 220).returns('the instance')
          assert_equal 'the instance', klass.from_css('rgb(26%,15%,86%)')
        end
    
        should "accept fractional percentages in rgb notation" do
          klass = IQ::Color::RGB
          klass.stubs(:new).with(67, 39, 222).returns('the instance')
          assert_equal 'the instance', klass.from_css('rgb(26.3%,15.2%,86.8%)')
        end

        should "raise when format is unrecognised" do
          assert_raise(ArgumentError) { IQ::Color::RGB.from_css('nonsense') }
        end
      end
    end
  end
end