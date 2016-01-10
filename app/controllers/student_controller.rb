class StudentController < ApplicationController

    def show
        @student = Student.find_by(login: session[:login])
    end

end
