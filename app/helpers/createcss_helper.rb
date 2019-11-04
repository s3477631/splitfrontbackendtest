module CreatecssHelper
  require 'tempfile'
  def self.createstyles(webcode)
  begin
    file = Tempfile.new(['styles', '.css'])
    file.write(".grid-container{display: grid; grid-template-columns: #{webcode.bottom_l}% #{webcode.bottom_m}% #{webcode.bottom_r}%}")
    file.rewind
  p  file.read
  ensure
    file.close
    file.unlink   # deletes the temp file
  end
  end
end



