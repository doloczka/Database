class StudentController < ApplicationController
    before_action :aktywny_student, only: :show
    
    def show
        @student = Student.find_by(login: session[:login])
        @progr=Progre.find_by(student_id: session[:user_id])

        @zad=WylosowaneZadanium.find_by(student_id: session[:user_id])
        if @zad.nil?
         @gr=Grupy.find_by(id: @student.grupy_id)
         for j in 1..5 do
          for i in 1..5 do
            #zadania na dzien1
            
            wszystkiezadania=ZadaniaGlowne.where(wykladowca_id: @gr.wykladowca_id, poziom_zadania: j , nr_zadania: i).count
            los11=session[:user_id]%wszystkiezadania
            if los11==0
                los11=1
            end
            data={
                "student_id"=>session[:user_id],
                "poziom"=>j,
                "numer"=>i,
                "zadania_glowne_id"=>los11
            }
            @zad=WylosowaneZadanium.new(data)
            @zad.save
          end
         end
        end
        
    end
    
    def aktywny_student
       redirect_to root_url if zalogowany_student.nil?
    end 
    
    def zad11
        @zad=Rozwiazanium.find_by(student_id: session[:user_id])
        @zad.update_attributes(:odpowiedz => params[:zad][:odp], :data =>  DateTime.now, :godzina=>  DateTime.now.strftime("%H:%M"))
        if @zad.save
           redirect_to :back
        end
    end
    def zad12
        @zad=Rozwiazanium.find_by(student_id: session[:user_id])
        @zad.update_attributes(:odpowiedz => params[:zad][:odp], :data =>  DateTime.now, :godzina=>  DateTime.now.strftime("%H:%M"))
        if @zad.save
           redirect_to :back
        end
    end
    
    def za1
        
        
    end
    
    
end
