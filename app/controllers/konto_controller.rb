class KontoController < ApplicationController

  
  include KontoHelper

  def logowanie_form
  end
  
  def logowanie
    student = Student.find_by(login: params[:session][:login])
    wykladowca = Wykladowca.find_by(login: params[:session][:login])
    if student && student.haslo == params[:session][:haslo]  
      log_in(student)
      redirect_to student 
    elsif wykladowca && wykladowca.haslo == params[:session][:haslo]
      log_in(wykladowca)
      redirect_to wykladowca 
    else
      redirect_to logowanie_form_path
    end
  end
  
  def wylogowanie
    redirect_to logowanie_form_path
    log_out
  end

<<<<<<< HEAD
  def student
    
  end
  
<<<<<<< HEAD
  def wyloguj
    if session[:user_id]
      session[:user_id] = nil
      redirect_to :action => "logowanie"
    end
  end
=======
  private
    def zalogowany_student
      redirect_to root_url if !student.nil?
    end
    
    def zalogowany_wykladowca
      redirect_to root_url if !wykladowca.nil?
    end
  
>>>>>>> edc49ac1c3fc436c650d127d623b94cb541704b9
=======
>>>>>>> aedf507fd67bab66a1d345e8f95b83e5db1b085c
end
