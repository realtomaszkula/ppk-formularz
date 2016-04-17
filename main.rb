require 'yomu'

class Article
  def initialize(general, details)
    @kapiteloversikt = general[:kapiteloversikt]
    @kapitel = general[:kapitel]
    @namn = general[:namn]
    @details = details
  end
end


def extract(string)
  hash = {}

  string.split(/\*\*/).each do |s|
    s = s.split(" ")
    next if s.empty?

    k = s[0].gsub!(/\W/,"")
    v = s[1..-1].join(" ")
    hash[k] = v
  end

  hash
end

doc = Yomu.new 'test.docx'

g, d = doc.text.split('---')

general = extract(g)
details = extract(d)





