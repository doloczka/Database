class StudentController < ApplicationController

    def show
        @student = Student.find_by(id: session[:user_id])
    end

end
