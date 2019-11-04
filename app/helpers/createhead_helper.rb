module CreateheadHelper
    require 'tempfile'
    def self.createhead 
        begin 
            file = Tempfile.new(['index', '.html'])
            file.write('<html><head> <link rel="stylesheet" href="styles.css"</head>')
            file.rewind
          p  file.read
        ensure  
            file.close
            file.unlink 
        end
    end
end