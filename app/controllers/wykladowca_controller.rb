class WykladowcaController < ApplicationController
    def show
        @wykladowca = Wykladowca.find_by(id: session[:user_id])
    end

end
