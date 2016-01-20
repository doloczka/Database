class StudentController < ApplicationController
    before_action :aktywny_student, only: :show
  
      
  def new
    grupy = Grupy.find(params[:grupy_id])
    @students = grupy.students.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @students }
    end
  end
  
  def create
    grupy = Grupy.find(params[:grupy_id])
    @students = grupy.students.create(student_params_wykladowca)
    @students.login = params[:student][:nralbumu]
    @students.haslo = params[:student][:nralbumu]
    respond_to do |format|
      if @students.save
        format.html { redirect_to :back, notice: 'Grupy was successfully created.' }
        format.json { render :show, status: :created, location: @students }
      else
        format.html { render :action => "new" }
        format.json { render json: @students.errors, status: :unprocessable_entity }
      end
    end
    student = Student.find_by(nralbumu: params[:student][:nralbumu] )
    progres = Progre.new(student_id: student.id, pkt_rankingowe: "0", zdrowie: "100", doswiadczenie: "0", level: 1)
    progres.save
  end
  

  
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
            los11= session[:user_id] % wszystkiezadania
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
       gr= Student.find(session[:user_id])
       progresy=Progre.order(pkt_rankingowe: :desc)
        i=1
        k=0
       progresy.each do |pr|
       k=k+1
            if pr.student_id==session[:user_id]
                @ran=i
                @j=k
            end
            gru=Student.find(pr.student_id)
            if gru.grupy_id==gr.grupy_id
                i=i+1
            end
       end
    end
    
    def aktywny_student
       redirect_to root_url if zalogowany_student.nil?
    end 
    
    def rozwiazanie
        @zad=Rozwiazanium.find_by(student_id: session[:user_id])
        idzadania=WylosowaneZadanium.find_by(student_id: session[:user_id], poziom: params[:zad][:poziom_zadania], numer: params[:zad][:nr_zadania])
        tre=ZadaniaGlowne.find_by(id: idzadania.zadania_glowne_id)
        @zad.update_attributes(:odpowiedz => params[:zad][:odp], :tresc_zadania =>  tre.tresc, :punkty => params[:zad][:punkty])
        if @zad.save
           redirect_to :back
        end
    end

    def challengeinbox
        @wyzwania=ZadaniaPoboczne.where(wyzwany: session[:user_id])
    end
    
    
    def edit
        @student = find_student
    end
    
    def update
      @student = find_student
      if zalogowany_student?
        @student.nr_logowania = true
        respond_to do |format|
         if @student.update(student_param)
            format.html { redirect_to @student, notice: 'Student was successfully updated.' }
            format.json { render :show, status: :ok, location: @student }
         else
            format.html { render :action => "edit" }
            format.json { render json: @student.errors, status: :unprocessable_entity }
         end
        end
      end
      if zalogowany_wykladowca?
        respond_to do |format|
          if @student.update(student_params_wykladowca)
            format.html { redirect_to @student, notice: 'Student was successfully updated.' }
            format.json { render :show, status: :ok, location: @grupy }
          else
            format.html { render :action => "edit" }
            format.json { render json: @student.errors, status: :unprocessable_entity }
          end
        end
      end
    end
    
    def destroy
        @student = Student.find(params[:id])
        @student.destroy
        respond_to do |format|
            format.html { redirect_to :back, notice: 'Student was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
    
    def challenge
        student=Student.find(session[:user_id])
        @idgru=Student.where(grupy_id: student.grupy_id)
    end
    
    def chosechallenge
        poziom=Progre.find_by(student_id: session[:user_id])
        @zadania=ZadaniaGlowne.where(poziom_zadania: poziom.level)   
        @wyzwany=Student.find(params[:idst])
    end
    
    def challengeconfirm
         student=Student.find(session[:user_id])
        grupa=Grupy.find_by(student.grupy_id)
        zadanie=ZadaniaGlowne.find(params[:zad][:zadanie])
        data={
            "wykladowca_id" => grupa.wykladowca_id ,
            "poziom_zadania" => zadanie.poziom_zadania ,
            "zadanie_tresc" => zadanie.tresc ,
            "wyzywajacy" => session[:user_id],
            "odpowiedz_wyzywajacego" => params[:zad][:odp],
            "wyzwany" => params[:zad][:wyzwany],
            "odpowiedz_wyzwanego" => "",
            "status" => "0"
        }
        ZadaniaPoboczne.new(data).save
        redirect_to root_url
    end
    
    def challengeconfirm2
        wyzwanie=ZadaniaPoboczne.find(params[:zad][:wyzwanie])
        wyzwanie.update_attributes(:odpowiedz_wyzwanego => params[:zad][:odp] , :status=>1)
        if wyzwanie.save
            redirect_to root_url
        end
    end
    
    private
    
    def aktywny_student
       redirect_to root_url if zalogowany_student.nil?
    end
    def student_params_wykladowca
        params.require(:student).permit(:nralbumu)
    end
    def student_param
      params.require(:student).permit(:login,:haslo,:email,:imie,:nazwisko)
    end
    
    def find_student
        Student.find(params[:id])
    end
 
end
