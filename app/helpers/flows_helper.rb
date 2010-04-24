module FlowsHelper
    def self.output (what, *args)
        FlowsHelper.method("output_#{what.to_s}".to_sym).call(*args)
    end

    def self.output_title (flow)
        return ERB::Util.h flow.title
    end

    def self.output_content (drop)
        content = drop.content.gsub(/</, '&lt;').gsub(/>/, '&gt;')

        content.scan(/("([^"]+)":([^\s]+))/).uniq.each {|match|
            content.gsub!(/#{Regexp.escape(match[0])}/, "<a href='#{SyntaxHighlighter::Language.escape(match[2])}'>#{ERB::Util.h match[1]}</a>")
        }

        content.gsub!('"', '&quot;')

        content.scan(/^(\s*&lt; \/code(s)?\/(\d+))$/).uniq.each {|match|
            content.gsub!(/#{Regexp.escape(match[0])}/, ActionView::Base.new(Rails::Configuration.new.view_path).render(:partial => 'codes/show', :locals => { :code => Code.find(match[2]), :inDrop => true }))
        }

        return content
    end
end
