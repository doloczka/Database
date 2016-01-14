class KontoController < ApplicationController

  
  include KontoHelper

  def logowanie_form
  end
  
  def logowanie
    student = Student.find_by(login: params[:session][:login])
    wykladowca = Wykladowca.find_by(login: params[:session][:login])
    if student && student.haslo == params[:session][:haslo]  
      log_in(student)
      if student.nr_logowania
        redirect_to student
      else
        redirect_to edit_student_path(student.id)
      end
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


  private
    def zalogowany_student
      redirect_to root_url if !student.nil?
    end
    
    def zalogowany_wykladowca
      redirect_to root_url if !wykladowca.nil?
    end
  
end
