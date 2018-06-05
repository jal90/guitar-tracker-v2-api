# frozen_string_literal: true

class GuitarsController < ProtectedController
  before_action :set_guitar, only: %i[show update destroy]

  # GET /guitars
  # GET /guitars.json
  def index
    @guitars = current_user.guitars

    render json: @guitars
  end

  # GET /guitars/1
  # GET /guitars/1.json
  def show
    render json: @guitar
  end

  # POST /guitars
  # POST /guitars.json
  def create
    @guitar = current_user.guitars.build(guitar_params)

    if @guitar.save
      render json: @guitar, status: :created
    else
      render json: @guitar.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guitars/1
  # PATCH/PUT /guitars/1.json
  def update
    if @guitar.update(guitar_params)
      render json: @guitar
    else
      render json: @guitar.errors, status: :unprocessable_entity
    end
  end

  # DELETE /guitars/1
  # DELETE /guitars/1.json
  def destroy
    @guitar.destroy

    head :no_content
  end

  def set_guitar
    @guitar = current_user.guitars.find(params[:id])
  end

  def guitar_params
    params.require(:guitar).permit(:make, :model, :year, :price)
  end

  private :set_guitar, :guitar_params
end
