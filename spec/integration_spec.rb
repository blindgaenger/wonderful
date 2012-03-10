require 'wonderful'
require 'minitest/spec'
require 'minitest/autorun'

class Honey
  def i_love_you(subtext=nil)
    if subtext == :forever
      :oh_stevie
    else
      :i_love_you_too
    end
  end
end

describe Wonderful do

  it 'just calls to say it loves me and it means it from the bottom of its heart' do
    Wonderful::I.just_called(Honey.new).to_say(:i_love_you).and_i_mean(:i_love_you_too)
  end

  it 'just calls to say I love her for ever' do
    Wonderful::I.just_called(Honey.new).to_say(:i_love_you, :forever).and_i_mean(:oh_stevie)
  end

  it 'hangs up, if it is not love' do
    lambda {
      Wonderful::I.just_called(Honey.new).to_say(:whassup).and_i_mean(:i_love_you_too)
    }.must_raise Wonderful::HangUpError
  end

  it 'hangs up, if it is not for ever' do
    lambda {
      Wonderful::I.just_called(Honey.new).to_say(:i_love_you, :sometimes).and_i_mean(:oh_stevie)
    }.must_raise Wonderful::HangUpError
  end

end
