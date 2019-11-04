module WebcodesHelper
    require 'createcss_helper'
    require 'createhead_helper'
    require 'createbody_helper'
    def self.createpage(webcode)
        @mysitestyles =  CreatecssHelper.createstyles(webcode)
        @mysiteshead = CreateheadHelper.createhead
     include CreateheadHelper
    end
end
