# I Love You

happy path testing … for those who are blinded by love

## Syntax

    I just called to say I love you
    And I mean it from the bottom of my heart

## Example

Image you've got a `honey` like this:

    class Honey
      def i_love_you
        :i_love_you_too
      end
    end

So sing this wonderful song, and if she repsonds to `i_love_you` everything is fine.

    I.just_called(honey).to_say(:i_love_you).and_i_mean_it

The skeptical guy may even check for the correct response:

    I.just_called(honey).to_say(:i_love_you).and_i_mean(:i_love_you_too)

If you're just an idiot, she'll hang up:

    I.just_called(honey).to_say(:wanna_fuck).and_i_mean_it # => HangUpError

But the same happens if your honey isn't the right one and she doesn't answer your love:

    def honey.i_love_you
      :go_to_hell
    end

    I.just_called(honey).to_say(:i_love_you).and_i_mean(:i_love_you_too) # => HangUpError

Yep, that's all!
