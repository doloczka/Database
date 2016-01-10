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

end
