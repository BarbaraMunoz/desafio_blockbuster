class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :set_movies, only: %i[ new edit create destroy update]
  

  # GET /clients or /clients.json
  def index
    @clients = Client.all.order(id: :asc)
    @movies = Movie.all
    @pagy, @clients = pagy(Client.all) # Gema pagy
  end

  # GET /clients/1 or /clients/1.json
  def show

  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)
  
    # Verifica si el valor de movie_id está presente en los parámetros
    if params[:client][:movie_id].blank?
      @client.movie_id = nil  # Establece movie_id como nulo si no se selecciona una película
    end
  
    respond_to do |format|
      if @client.save
        format.html { redirect_to client_url(@client), notice: "Cliente creado con éxito" }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Cliente actualizado con éxito" }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Cliente eliminado con éxito" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def set_movies
      @movies = Movie.all.pluck :name, :id
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :age, :movie_id)
    end    
end