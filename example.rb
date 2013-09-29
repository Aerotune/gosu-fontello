require "gosu"
require './fontello_config'

class Window < Gosu::Window
  def initialize
    super 800, 600, false
    @scale = 1.0
    @font_size = 16
    
    @icon_characters = FontelloConfig.parse_file './fontello_icon_webfont/config.json'
    @all_icons = @icon_characters.map {|k,v| v}
        
    @gosu_font = Gosu::Font.new(self, './fontello_icon_webfont/font/some_neat_icons.ttf', @font_size)
  end
  
  def draw
    draw_white_backdrop
    draw_pencil_icon
    draw_all_font_icons  
  end
  
  def draw_pencil_icon
    # Draw icon in bottom right corner
    draw_font_icon @icon_characters['icon-pencil'], width-20, height-20
  end
  
  def draw_all_font_icons
    size = @gosu_font.height * @scale
    margin = size*1.3
    amount = (width/(size+margin)).to_i
    
    @all_icons.each_with_index do |icon, index|
      x = ((index%amount)).to_i * size + (margin*(index%amount).to_i) + margin/2.0
      y = ((index/amount)).to_i * size + (margin*(index/amount).to_i) + margin/2.0
      draw_font_icon icon, x, y
    end
  end
  
  def draw_font_icon character, x, y
    black_color = 0xFF000000
    z = 0
    @gosu_font.draw(character, x, y, z, @scale, @scale, black_color)
  end
  
  
  def draw_white_backdrop
    background_color = 0xFFFFFFFF
    draw_quad 0     ,0      ,background_color,
              width ,0      ,background_color,
              width ,height ,background_color,
              0     ,height ,background_color
  end
end

Window.new.show