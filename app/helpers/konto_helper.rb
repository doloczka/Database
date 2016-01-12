module KontoHelper
    
    def log_in(user)
        session[:login] = user.login
        session[:haslo] = user.haslo
        session[:user_id] = user.id
    end
    
    def log_out
        session.delete(:login)
        session.delete(:haslo)
        session.delete(:user_id)
    end
    
    def zalogowany_student
        @zalogowany_uzytkownik ||= Student.find_by(login: session[:login])
    end
    
    def zalogowany_wykladowca
        @zalogowany_uzytkownik ||= Wykladowca.find_by(login: session[:login])
    end
    
    def zalogowany?
       !zalogowany_student.nil? || !zalogowany_wykladowca.nil?
    end
    
    
end
