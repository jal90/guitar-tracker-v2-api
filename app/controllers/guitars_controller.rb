# frozen_string_literal: true

# TODO: rethink Guitar controller entirely. Since Guitar is now a resource that
# is shared by many users, no one user (except perhaps an admin) should be able
# to delete or modify any guitar entry.
class GuitarsController < ProtectedController
  before_action :set_guitar, only: %i[show update destroy]
  before_action :check_admin_status, only: %i[update destroy]
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
    # @guitar = current_user.guitars.build(guitar_params)

    # Transitioning Guitars into a public resource to reduce data duplication
    # UserGuitars table will require current_user.user_guitars.build to ensure
    # authentication
    @guitar = Guitar.create(guitar_params)

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

  def check_admin_status
    head :unauthorized unless current_user[:is_admin]
  end

  def guitar_params
    params.require(:guitar).permit(:make, :model)
  end

  private :set_guitar, :guitar_params
end
