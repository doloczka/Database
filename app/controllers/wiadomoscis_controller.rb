class WiadomoscisController < ApplicationController
  before_action :set_wiadomosci, only: [:show, :edit, :update, :destroy]

  # GET /wiadomoscis
  # GET /wiadomoscis.json
  def index
    if zalogowany_student?
        @wiadomoscis = Wiadomosci.where(student_id: session[:user_id], przeczytana: "0")
    end
    if zalogowany_wykladowca?
      @wiadomoscis = Wiadomosci.where(wykladowca_id: session[:user_id], przeczytana: "1")
    end
  
  end

  # GET /wiadomoscis/1
  # GET /wiadomoscis/1.json
  def show
   
  end

  # GET /wiadomoscis/new
  def new
    @wiadomosci = Wiadomosci.new
  end

  # GET /wiadomoscis/1/edit
  def edit
  end

  # POST /wiadomoscis
  # POST /wiadomoscis.json
  def create
   if zalogowany_student?
    createstu
   end
   if zalogowany_wykladowca?
    createwy
   end
  end
  
  
  
  
  # PATCH/PUT /wiadomoscis/1
  # PATCH/PUT /wiadomoscis/1.json
  def update
    respond_to do |format|
      if @wiadomosci.update(wiadomosci_params)
        format.html { redirect_to @wiadomosci, notice: 'Wiadomosci was successfully updated.' }
        format.json { render :show, status: :ok, location: @wiadomosci }
      else
        format.html { render :edit }
        format.json { render json: @wiadomosci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wiadomoscis/1
  # DELETE /wiadomoscis/1.json
  def destroy
    @wiadomosci.destroy
    respond_to do |format|
      format.html { redirect_to wiadomoscis_url, notice: 'Wiadomosci was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiadomosci
      @wiadomosci = Wiadomosci.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiadomosci_params
      params.require(:wiadomosci).permit(:temat, :tresc)
    end
    
    def createstu
    student=Student.find_by(id: session[:user_id])
    gr=Grupy.find_by(student.grupy_id)
    @wiadomosci = Wiadomosci.new(wiadomosci_params)
    @wiadomosci.student_id=session[:user_id]
    @wiadomosci.wykladowca_id=gr.wykladowca_id
    @wiadomosci.przeczytana="1"
    
      respond_to do |format|
        if @wiadomosci.save
          format.html { redirect_to @wiadomosci, notice: 'Wiadomosci was successfully created.' }
          format.json { render :show, status: :created, location: @wiadomosci }
        else
          format.html { render :new }
          format.json { render json: @wiadomosci.errors, status: :unprocessable_entity }
        end
      end
    end
    def createwy #todo loko wiadomosci
      student=Student.find_by(nralbumu: params[@wiadomosci.nralbumu])
      gr=Grupy.find_by(student.grupy_id)
      @wiadomosci = Wiadomosci.new(wiadomosci_params)
      @wiadomosci.student_id=session[:user_id]
      @wiadomosci.wykladowca_id=gr.wykladowca_id
      @wiadomosci.przeczytana="0"
        respond_to do |format|
          if @wiadomosci.save
            format.html { redirect_to @wiadomosci, notice: 'Wiadomosci was successfully created.' }
            format.json { render :show, status: :created, location: @wiadomosci }
          else
            format.html { render :new }
            format.json { render json: @wiadomosci.errors, status: :unprocessable_entity }
          end
        end
    end
end
