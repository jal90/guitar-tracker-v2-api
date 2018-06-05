# frozen_string_literal: true

class SetupsController < OpenReadController
  before_action :set_setup, only: %i[update destroy]

  # GET /setups
  # GET /setups.json
  def index
    @setups = Setup.all

    render json: @setups
  end

  # GET /setups/1
  # GET /setups/1.json
  def show
    render json: Setup.find(params[:id])
  end

  # POST /setups
  # POST /setups.json
  def create
    @setup = current_user.setups.build(setup_params)

    if @setup.save
      render json: @setup, status: :created
    else
      render json: @setup.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /setups/1
  # PATCH/PUT /setups/1.json
  def update
    if @setup.update(setup_params)
      render json: @setup
    else
      render json: @setup.errors, status: :unprocessable_entity
    end
  end

  # DELETE /setups/1
  # DELETE /setups/1.json
  def destroy
    @setup.destroy

    head :no_content
  end

  def set_setup
    @setup = current_user.setups.find(params[:id])
  end

  def setup_params
    params.require(:setup).permit(:string_gauge, :guitar_id)
  end

  private :set_setup, :setup_params
end
