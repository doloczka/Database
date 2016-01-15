class ZadaniaGlownesController < ApplicationController
  before_action :set_zadania_glowne, only: [:show, :edit, :update, :destroy]

  # GET /zadania_glownes
  # GET /zadania_glownes.json
  def index
    @zadania_glownes = ZadaniaGlowne.all
    if zalogowany_student? #todo adam
      
  end

  # GET /zadania_glownes/1
  # GET /zadania_glownes/1.json
  def show
  end

  # GET /zadania_glownes/new
  def new
    @zadania_glowne = ZadaniaGlowne.new
  end

  # GET /zadania_glownes/1/edit
  def edit
  end

  # POST /zadania_glownes
  # POST /zadania_glownes.json
  def create
    @zadania_glowne = ZadaniaGlowne.new(zadania_glowne_params)

    respond_to do |format|
      if @zadania_glowne.save
        format.html { redirect_to @zadania_glowne, notice: 'Zadania glowne was successfully created.' }
        format.json { render :show, status: :created, location: @zadania_glowne }
      else
        format.html { render :new }
        format.json { render json: @zadania_glowne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zadania_glownes/1
  # PATCH/PUT /zadania_glownes/1.json
  def update
    respond_to do |format|
      if @zadania_glowne.update(zadania_glowne_params)
        format.html { redirect_to @zadania_glowne, notice: 'Zadania glowne was successfully updated.' }
        format.json { render :show, status: :ok, location: @zadania_glowne }
      else
        format.html { render :edit }
        format.json { render json: @zadania_glowne.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zadania_glownes/1
  # DELETE /zadania_glownes/1.json
  def destroy
    @zadania_glowne.destroy
    respond_to do |format|
      format.html { redirect_to zadania_glownes_url, notice: 'Zadania glowne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zadania_glowne
      @zadania_glowne = ZadaniaGlowne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zadania_glowne_params
      params.require(:zadania_glowne).permit(:poziom_zadania,:nr_zadania,:pkt_za_zadanie,:tresc,:podpowiedz)
    end
end
