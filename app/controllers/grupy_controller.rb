class GrupyController < ApplicationController
    def index
        @grupy = Grupy.all
    
        respond_to do |wants|
            wants.html # index.html.erb
            wants.xml  { render :xml => @grupys }
        end
    end
end
