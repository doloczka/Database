class WykladowcaController < ApplicationController
    before_action :aktywny_wykladowca, only: :show
    
    def show
        @wykladowca = Wykladowca.find(params[:id])
    end
    
    private
    
    def aktywny_wykladowca
        if zalogowany_wykladowca.nil?
             redirect_to root_url
        end
    end
    
    
end
