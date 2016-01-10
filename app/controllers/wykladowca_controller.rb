class WykladowcaController < ApplicationController
    before_action :zalogowany_wykladowca, only: :show
    
    def show
        @wykladowca = Wykladowca.find_by(login: session[:login])
    end
    
    private
    
    def zalogowany_wykladowca
        @user = Wykladowca.find(params[:id])
        redirect_to(root_url) unless aktualny_wykladowca?(@user)
    end
end
