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
    @students = grupy.students.create(student_params)
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
        respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Grupy was successfully updated.' }
        format.json { render :show, status: :ok, location: @grupy }
      else
        format.html { render :action => "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
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
    def student_params
        params.require(:student).permit(:nralbumu)
    end
    def find_student
        Student.find(params[:id])
    end
end
