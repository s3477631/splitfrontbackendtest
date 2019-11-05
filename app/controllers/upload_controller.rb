class UploadController < WebcodesController 
    require 'webcodes_helper'
    def self.new(webcode)
         @mainpage = WebcodesHelper.createpage(webcode)
         @downloadpage = File.open('/tmp/src/styles/style.css', 'rb')
        # send_file @downloadpage, :filename => 'style.css', :type => "text/css; charset=utf-8", :disposition => "attachment"
     
        # File.open("/tmp/src/styles/style.css", 'r') do |f|
        #    send_data f.read
        # end
    end
end