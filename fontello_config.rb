require 'json'

module FontelloConfig
  class << self
    def parse_file file_name
      parse File.read file_name
    end
    
    def parse json
      icon_data  = JSON.parse json
      characters = {}
      
      prefix  = ""
      suffix  = ""
      
      if icon_data['css_use_suffix']
        suffix = icon_data['css_prefix_text']
      else
        prefix = icon_data['css_prefix_text']
      end
      
      icon_data["glyphs"].each do |glyph|
        icon_name = prefix + glyph['css'] + suffix
        character = glyph['code'].chr('UTF-8')
        
        characters[icon_name] = character
      end
      
      characters
    end # parse
  end # << self
end # FontelloConfig