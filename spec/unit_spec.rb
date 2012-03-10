require 'wonderful'
require 'minitest/spec'
require 'minitest/autorun'

module Wonderful
  describe Wonderful do

    describe I do
      it 'can be included' do
        class Stevie
          include Wonderful
        end
        Stevie.constants.must_include :I
      end

      describe '#just_called' do
        it 'starts a call' do
          I.just_called.must_be_instance_of Call
        end

        it 'may take a callee' do
          call = I.just_called('you')

          call.must_be_instance_of Call
          call.you.must_equal 'you'
        end
      end
    end

    describe Call do
      describe '#to_say' do
        before do
          @you = MiniTest::Mock.new
          @you.expect(:i_love_you, true)
          @call = Call.new(@you)
        end

        it 'makes a declaration of love' do
          declaration = @call.to_say(:i_love_you)

          declaration.must_be_instance_of Declaration
          declaration.call.must_equal @call
          declaration.message.must_equal :i_love_you
        end

        it 'may give the declaration some subtext' do
          declaration = @call.to_say(:i_love_you, {:since => 'yesterday'}, :forever)

          declaration.message.must_equal :i_love_you
          declaration.subtext.must_equal [{:since => 'yesterday'}, :forever]
        end
      end
    end

    describe Declaration do
      before do
        @you = MiniTest::Mock.new
        @you.expect(:i_love_you, :i_love_you_too)
        @call = MiniTest::Mock.new
        @call.expect(:you, @you)
      end

      describe '#and_i_mean_it' do
        it 'just calls without waiting for your answer' do
          Declaration.new(@call, :i_love_you).and_i_mean_it
        end

        it 'hangs up if you dont know what I am saying' do
          lambda {
            Declaration.new(@call, :whassup).and_i_mean_it
          }.must_raise HangUpError
        end
      end

      describe '#and_i_mean' do
        it 'calls and checks the answer' do
          @you.expect(:send, :i_love_you_too, [:i_love_you])
          Declaration.new(@call, :i_love_you).and_i_mean(:i_love_you_too)
        end

        it 'calls with the subtext' do
          @you.expect(:send, :i_love_you_too, [:i_love_you, :forever])
          Declaration.new(@call, :i_love_you, :forever).and_i_mean(:i_love_you_too)
        end

        it 'hangs up if the answer is wrong' do
          @you.expect(:send, :i_love_you_too, [:i_love_you])
          lambda {
            Declaration.new(@call, :i_love_you).and_i_mean(:whassup)
          }.must_raise HangUpError
        end
      end
    end

  end
end
