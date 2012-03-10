require 'wonderful/version'

module Wonderful

  class HangUpError < StandardError; end

  class I
    class << self
      def just_called(you=nil)
        Call.new(you)
      end
    end
  end

  class Call
    attr_reader :you
    def initialize(you)
      @you = you
    end

    def to_say(message, *subtext)
      Declaration.new(self, message.to_sym, subtext)
    end
  end

  class Declaration
    attr_reader :call, :message, :subtext
    def initialize(call, message, *subtext)
      @call = call
      @message = message
      @subtext = [subtext].flatten
    end

    def and_i_mean_it
      raise HangUpError unless @call.you.respond_to?(@message)
    end

    def and_i_mean(expected)
      and_i_mean_it
      answer = @call.you.send(@message.to_sym, *@subtext)
      raise HangUpError unless answer == expected
    end
  end

end
