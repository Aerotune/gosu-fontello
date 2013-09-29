gosu-fontello
=============

Drawing font icons from [Fontello.com](http://fontello.com "Fontello") in ruby gosu

## Example usage
    
    @gosu_font = Gosu::Font.new($window, '/path/to/fontello/font/file.ttf', font_size)
    @icon_characters = FontelloConfig.parse_file './path/to/fontello/config.json'
    @gosu_font.draw(@icon_characters['icon-pencil'], x, y, z, scale_x, scale_y, color)
