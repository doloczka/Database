class KontoController < ApplicationController
  include KontoHelper
  def rejestracja
  end

  
  def logowanie_form
  end
  
  def logowanie
    if student = Student.find_by(login: params[:session][:login])
      log_in(student)
      redirect_to panel_studenta_url
    elsif wykladowca = Wykladowca.find_by(login: params[:session][:login])
      log_in(wykladowca)
      redirect_to panel_wykladowcy_url
    else
      redirect_to root_url
    end
  end
  
  def pierwsze_logowanie
  end

  def wykladowca
    
  end

  def student
  end
end
