module Stagecoach
  class CctvTag
    attr_reader :camera, :time, :title
    def initialize tag_name, text, tokens
      tokenise text
    end

    def render context
      "<img src='/images/stagecoach/#{camera}/#{time}_#{camera}.jpg' alt='#{title}' title='#{title}' class='stagecoach'>"
    end

    def tokenise tag_contents
      tokenised = tag_contents.split
      @time = tokenised[0]
      @camera = tokenised[1]
      @title = tokenised[2..-1] * " "
    end
  end

  class FirstSection  < Liquid::Tag
    def render context
      "<div class='stagecoach_section'>"
    end
  end

  class Section  < Liquid::Tag
    def render context
      "</div><div class='stagecoach_section'>"
    end
  end
  class LastSection  < Liquid::Tag
    def render context
      "</div>"
    end
  end
end


Liquid::Template.register_tag('cctv', Stagecoach::CctvTag)
Liquid::Template.register_tag('stagecoach_first', Stagecoach::FirstSection)
Liquid::Template.register_tag('stagecoach', Stagecoach::Section)
Liquid::Template.register_tag('stagecoach_last', Stagecoach::LastSection)

p "oooh"
