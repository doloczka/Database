class GrupiesController < ApplicationController

  # GET /grupies
  # GET /grupies.json
  def index
    @grupies = Grupy.where("wykladowca_id = :wykladowca_id", wykladowca_id: params[:wykladowca_id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @grupies }
    end
  end

  # GET /grupies/1
  # GET /grupies/1.json
  def show
    @grupy = Grupy.find(params[:id])
    @students = Student.where("grupy_id = :grupy_id", grupy_id: @grupy.id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @grupy }
    end
  end

  # GET /grupies/new
  def new
    wykladowca = Wykladowca.find(params[:wykladowca_id])
    @grupy = wykladowca.grupies.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grupy }
    end
  end

  # GET /grupies/1/edit
  def edit
    @grupy = Grupy.find(params[:id])
  end

  # POST /grupies
  # POST /grupies.json
  def create
    wykladowca = Wykladowca.find(params[:wykladowca_id])
    @grupy = wykladowca.grupies.create(grupy_params)
    respond_to do |format|
      if @grupy.save
        format.html { redirect_to @grupy, notice: 'Grupy was successfully created.' }
        format.json { render :show, status: :created, location: @grupy }
      else
        format.html { render :action => "new" }
        format.json { render json: @grupy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupies/1
  # PATCH/PUT /grupies/1.json
  def update
    @grupy = Grupy.find(params[:id])
    respond_to do |format|
      if @grupy.update(grupy_params)
        format.html { redirect_to @grupy, notice: 'Grupy was successfully updated.' }
        format.json { render :show, status: :ok, location: @grupy }
      else
        format.html { render :action => "edit" }
        format.json { render json: @grupy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupies/1
  # DELETE /grupies/1.json
  def destroy
    @grupy = Grupy.find(params[:id])
    @grupy.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Grupy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupy_params
      params.require(:grupy).permit(:nazwa)
    end
end
