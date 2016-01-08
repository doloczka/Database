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
      @current_user = student
      redirect_to panel_studenta_url
    elsif wykladowca && wykladowca.haslo == params[:session][:haslo]
      log_in(wykladowca)
      @current_user = wykladowca
      redirect_to panel_wykladowcy_url
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

  def wykladowca
    
  end

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
end
