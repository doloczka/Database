class DatabaseController < ApplicationController
    def index
        if zalogowany?
            if zalogowany_wykladowca
                redirect_to zalogowany_wykladowca
            else
                redirect_to zalogowany_student
            end
        else
            redirect_to logowanie_form_path
        end
    end
end
