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
            zad=ZadaniaGlowne.where(wykladowca_id: @gr.wykladowca_id, poziom_zadania: j , nr_zadania: i).first(los11).last
            data={
                "student_id"=>session[:user_id],
                "poziom"=>j,
                "numer"=>i,
                "zadania_glowne_id"=>zad.id
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
        idzadania=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: "1", numer: "1")
        tre=ZadaniaGlowne.find_by(id: idzadania.zadania_glowne_id)
        @zad.update_attributes(:odpowiedz => params[:zad][:odp], :tresc_zadania =>  tre.tresc)
        if @zad.save
           redirect_to :back
        end
    end
    def zad12
        @zad=Rozwiazanium.find_by(student_id: session[:user_id])
        idzadania=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: "1", numer: "2")
        tre=ZadaniaGlowne.find_by(id: idzadania.zadania_glowne_id)
        @zad.update_attributes(:odpowiedz => params[:zad][:odp], :tresc_zadania =>  tre.tresc)
        if @zad.save
           redirect_to :back
        end
    end
    def zad13
        @zad=Rozwiazanium.find_by(student_id: session[:user_id])
        idzadania=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: "1", numer: "3")
        tre=ZadaniaGlowne.find_by(id: idzadania.zadania_glowne_id)
        @zad.update_attributes(:odpowiedz => params[:zad][:odp], :tresc_zadania =>  tre.tresc)
        if @zad.save
           redirect_to :back
        end
    end
    def zad14
        @zad=Rozwiazanium.find_by(student_id: session[:user_id])
        idzadania=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: "1", numer: "4")
        tre=ZadaniaGlowne.find_by(id: idzadania.zadania_glowne_id)
        @zad.update_attributes(:odpowiedz => params[:zad][:odp], :tresc_zadania =>  tre.tresc)
        if @zad.save
           redirect_to :back
        end
    end
    def zad15
        @zad=Rozwiazanium.find_by(student_id: session[:user_id])
        idzadania=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: "1", numer: "5")
        tre=ZadaniaGlowne.find_by(id: idzadania.zadania_glowne_id)
        @zad.update_attributes(:odpowiedz => params[:zad][:odp], :tresc_zadania =>  tre.tresc)
        if @zad.save
           redirect_to :back
        end
    end
    
    
    
    def za1
        idzadania11=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: "1", numer: "1")
        @tre11=ZadaniaGlowne.find_by(id: idzadania11.zadania_glowne_id)
        idzadania11=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: "1", numer: "2")
        @tre12=ZadaniaGlowne.find_by(id: idzadania11.zadania_glowne_id)
        idzadania11=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: "1", numer: "3")
        @tre13=ZadaniaGlowne.find_by(id: idzadania11.zadania_glowne_id)
        idzadania11=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: "1", numer: "4")
        @tre14=ZadaniaGlowne.find_by(id: idzadania11.zadania_glowne_id)
        idzadania11=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: "1", numer: "5")
        @tre15=ZadaniaGlowne.find_by(id: idzadania11.zadania_glowne_id)
    end
    
    def inbox
    
    end
    
    
end
