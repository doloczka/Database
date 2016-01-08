class KontoController < ApplicationController
  before_action :zalogowany_student, only: [:student]
  before_action :zalogowany_wykladowca, only: [:wykladowca]
  
  include KontoHelper
  def rejestracja
  end

  
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
  
  def pierwsze_logowanie
  end

  
  private
    def zalogowany_student
      redirect_to root_url if @@student.nil?
    end
    
    def zalogowany_wykladowca
      redirect_to root_url if @@wykladowca.nil?
    end
  
end
