class StudentController < ApplicationController
    before_action :aktywny_student, only: :show
    def show
        @student = Student.find_by(login: session[:login])
    end
    
    private
    
    def aktywny_student
       redirect_to root_url if zalogowany_student.nil?
     end 
end
