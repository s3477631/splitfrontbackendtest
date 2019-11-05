module CreatecssHelper
  require 'tempfile'
  require 'fileutils'
  def self.createstyles(webcode)
     @user_website = FileUtils.mkdir_p("/tmp/src/styles/")
    FileUtils.cd("/tmp/src/styles/")
    FileUtils.touch('style.css')
    File.open("style.css", "wb+") {|f| f.write (".grid-container{display: grid; grid-template-columns: #{webcode.bottom_l}% #{webcode.bottom_m}% #{webcode.bottom_r}%}")}

  p IO.read('style.css')
   
  # File.open("style.css", "r") {|f| f.read }
  # p IO.read('style.css')
    # p File.open("style.css", "r"){|f| f.read }
  #  send_file style.css
  # FileUtils.write(".grid-container{display: grid; grid-template-columns: #{webcode.bottom_l}% #{webcode.bottom_m}% #{webcode.bottom_r}%}")
  #   temp_file = Tempfile.new(['styles', '.css'])
  #   temp_file.write(".grid-container{display: grid; grid-template-columns: #{webcode.bottom_l}% #{webcode.bottom_m}% #{webcode.bottom_r}%}")
  #   # file.rewind
  #   # file.read 

  #   #  send_tempfile(file, :filename => 'styles.css')
  #   # temp_file.chmod(0644)
  #   # send_file(temp_file, :filename => 'styles.css')
  # ensure
  #   temp_file.close
  # end
  # ensure
  #   file.close
  #   file.unlink   # deletes the temp file
  # end
  end
end



