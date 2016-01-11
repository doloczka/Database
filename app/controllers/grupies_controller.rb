class GrupiesController < ApplicationController
  before_action :set_grupy, only: [:show, :edit, :update, :destroy]

  # GET /grupies
  # GET /grupies.json
  def index
    @grupies = Grupy.all
  end

  # GET /grupies/1
  # GET /grupies/1.json
  def show
    @grupy = Grupy.find(params[:id])
  end

  # GET /grupies/new
  def new
    @grupy = Grupy.new
  end

  # GET /grupies/1/edit
  def edit
  end

  # POST /grupies
  # POST /grupies.json
  def create
    @grupy = Grupy.new(grupy_params)
    redirect_to url_for(:controller => 'grupies', :action => 'index')
    # respond_to do |format|
    #   if @grupy.save
    #     format.html { redirect_to @grupy, notice: 'Grupy was successfully created.' }
    #     format.json { render :show, status: :created, location: @grupy }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @grupy.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /grupies/1
  # PATCH/PUT /grupies/1.json
  def update
    respond_to do |format|
      if @grupy.update(grupy_params)
        format.html { redirect_to @grupy, notice: 'Grupy was successfully updated.' }
        format.json { render :show, status: :ok, location: @grupy }
      else
        format.html { render :edit }
        format.json { render json: @grupy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupies/1
  # DELETE /grupies/1.json
  def destroy
    @grupy.destroy
    respond_to do |format|
      format.html { redirect_to grupies_url, notice: 'Grupy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupy
      @grupy = Grupy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupy_params
      params.require(:grupy).permit(:nazwa)
    end
end
