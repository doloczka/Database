module KontoHelper
    
    def log_in(user)
        session[:login] = user.login
        session[:haslo] = user.haslo
        session[:user_id] = user.id
    end
    
    def log_out
        session.delete(:login)
        session.delete(:haslo)
    end
    
    def zalogowany_student
        @zalogowany_student ||= Student.find_by(login: session[:login])
    end
    
    def zalogowany_wykladowca
        @zalogowany_wykladowca ||= Wykladowca.find_by(login: session[:login])
    end
    
    def zalogowany?
       !zalogowany_student.nil? || !zalogowany_wykladowca.nil?
    end
    
    def aktualny_wykladowca?(user)
        user == zalogowany_wykladowca
    end
end
