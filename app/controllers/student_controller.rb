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
  end
  
    def show
        @student = Student.find_by(login: session[:login])
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
