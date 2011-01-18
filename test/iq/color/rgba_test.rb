require File.join(File.dirname(__FILE__), '..', '..', 'helper')

class IQ::Color::RGBATest < Test::Unit::TestCase
  context "class definition" do
    should "inherit from rgb class" do
      assert_equal IQ::Color::RGB, IQ::Color::RGBA.superclass
    end
  end

  context "instance methods" do
    context "initialize" do
      context "red" do
        should "raise when red value is not an integer" do
          not_an_integer = stub_everything
          not_an_integer.stubs(:is_a?).with(Integer).returns(false)
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(not_an_integer, mock_number, mock_number, mock_number)
          end
        end

        should "raise when red value is greater than 255" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(256, mock_number, mock_number, mock_number)
          end
        end

        should "raise when red value is less than zero" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(-1, mock_number, mock_number, mock_number)
          end
        end

        should "store red value in instance variable" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_equal 123, IQ::Color::RGBA.new(
            123, mock_number, mock_number, mock_number
          ).instance_variable_get('@red')
        end
      end
      
      context "green" do
        should "raise when green value is not an integer" do
          not_an_integer = stub_everything
          not_an_integer.stubs(:is_a?).with(Integer).returns(false)
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(mock_number, not_an_integer, mock_number, mock_number)
          end
        end

        should "raise when green value is greater than 255" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(mock_number, 256, mock_number, mock_number)
          end
        end

        should "raise when green value is less than zero" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(mock_number, -1, mock_number, mock_number)
          end
        end

        should "store green value in instance variable" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_equal 123, IQ::Color::RGBA.new(
            mock_number, 123, mock_number, mock_number
          ).instance_variable_get('@green')
        end
      end
      
      context "blue" do
        should "raise when blue value is not an integer" do
          not_an_integer = stub_everything
          not_an_integer.stubs(:is_a?).with(Integer).returns(false)
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(mock_number, mock_number, not_an_integer, mock_number)
          end
        end

        should "raise when blue value is greater than 255" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(mock_number, mock_number, 256, mock_number)
          end
        end

        should "raise when blue value is less than zero" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(mock_number, mock_number, -1, mock_number)
          end
        end

        should "store blue value in instance variable" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_equal 123, IQ::Color::RGBA.new(
            mock_number, mock_number, 123, mock_number
          ).instance_variable_get('@blue')
        end
      end
      
      context "alpha" do
        should "store alpha value of 1 when no forth argument supplied" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_equal 1.0, IQ::Color::RGBA.new(mock_number, mock_number, mock_number).instance_variable_get('@alpha')
        end
    
        should "raise when alpha value is not an integer or float" do
          not_an_integer_or_float = stub_everything
          not_an_integer_or_float.stubs(:is_a?).with(Integer).returns(false)
          not_an_integer_or_float.stubs(:is_a?).with(Float).returns(false)
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(mock_number, mock_number, mock_number, not_an_integer_or_float)
          end
        end

        should "raise when alpha value is greater than 1" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(mock_number, mock_number, mock_number, 1.1)
          end
        end

        should "raise when alpha value is less than zero" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          assert_raise(ArgumentError) do
            IQ::Color::RGBA.new(mock_number, mock_number, mock_number, -0.1)
          end
        end

        should "store alpha value as float in instance variable" do
          mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
          the_alpha = stub_everything(:< => false, :> => false)
          the_alpha.stubs(:is_a?).with(Integer).returns(true)
          the_alpha.stubs(:to_f).returns('floatified value')
          assert_equal 'floatified value', IQ::Color::RGBA.new(
            mock_number, mock_number, mock_number, the_alpha
          ).instance_variable_get('@alpha')
        end
      end
    end
    
    context "red" do
      should "return value of instance variable" do
        mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
        instance = IQ::Color::RGBA.new(mock_number, mock_number, mock_number, mock_number)
        instance.instance_variable_set '@red', 'the red'
        assert_equal 'the red', instance.red
      end
    end
    
    context "green" do
      should "return value of instance variable" do
        mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
        instance = IQ::Color::RGBA.new(mock_number, mock_number, mock_number, mock_number)
        instance.instance_variable_set '@green', 'the green'
        assert_equal 'the green', instance.green
      end
    end
    
    context "blue" do
      should "return value of instance variable" do
        mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
        instance = IQ::Color::RGBA.new(mock_number, mock_number, mock_number, mock_number)
        instance.instance_variable_set '@blue', 'the blue'
        assert_equal 'the blue', instance.blue
      end
    end
    
    context "alpha" do
      should "return value of instance variable" do
        mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
        instance = IQ::Color::RGBA.new(mock_number, mock_number, mock_number, mock_number)
        instance.instance_variable_set '@alpha', 'the alpha'
        assert_equal 'the alpha', instance.alpha
      end
    end
    
    context "to_css" do
      should "return colour values as an rgba css string" do
        mock_number = stub_everything(:is_a? => true, :< => false, :> => false)
        instance = IQ::Color::RGBA.new(mock_number, mock_number, mock_number, mock_number)
        instance.stubs(:red).returns(254)
        instance.stubs(:green).returns(220)
        instance.stubs(:blue).returns(186)
        instance.stubs(:alpha).returns(0.4)    
        assert_equal 'rgba(254,220,186,0.4)', instance.to_css
      end
    end
  end
  
  context "class methods" do
    context "from css" do
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
  
      should "raise for malformed 6 digit hex string" do
        assert_raise(ArgumentError) { IQ::Color::RGB.from_css('#fzdcba') }
      end
  
      should "raise given hex string of wrong length" do
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
  
      should "return new instance for rgba notation string" do
        klass = IQ::Color::RGBA
        klass.stubs(:new).with(254, 220, 186, 0.8).returns('the instance')
        assert_equal 'the instance', klass.from_css('rgba(254,220,186,0.8)')
      end

      should "allow spaces before and after values in rgba notation string" do
        klass = IQ::Color::RGBA
        klass.stubs(:new).with(254, 220, 186, 0.8).returns('the instance')
        assert_equal 'the instance', klass.from_css('rgba(  254 ,  220   ,  186  ,  0.8  )')
      end

      should "convert percentages in rgba notation to relevant rounded values" do
        klass = IQ::Color::RGBA
        klass.stubs(:new).with(67, 38, 220, 0.8).returns('the instance')
        assert_equal 'the instance', klass.from_css('rgba(26%,15%,86%,0.8)')
      end
  
      should "accept fractional percentages in rgba notation" do
        klass = IQ::Color::RGBA
        klass.stubs(:new).with(67, 39, 222, 0.8).returns('the instance')
        assert_equal 'the instance', klass.from_css('rgba(26.3%,15.2%,86.8%,0.8)')
      end
  
      should "return transparent color for transparent string" do
        klass = IQ::Color::RGBA
        klass.stubs(:new).with(0, 0, 0, 0).returns('the instance')
        assert_equal 'the instance', klass.from_css('transparent')
      end

      should "raise when format is unrecognised" do
        assert_raise(ArgumentError) { IQ::Color::RGB.from_css('nonsense') }
      end
    end
  end
end