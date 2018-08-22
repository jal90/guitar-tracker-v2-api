# frozen_string_literal: true

class UserGuitarsController < ProtectedController
  before_action :set_user_guitar, only: %i[show update destroy]

  # GET /user_guitars
  # GET /user_guitars.json
  def index
    @user_guitars = current_user.user_guitars

    render json: @user_guitars
  end

  # GET /user_guitars/1
  # GET /user_guitars/1.json
  def show
    render json: @user_guitar
  end

  # POST /user_guitars
  # POST /user_guitars.json
  def create
    @guitar = Guitar.where(make: guitar_params['make'], model: guitar_params['model'])
                    .first_or_create(guitar_params)

    # Next 2 lines are seemingly equivalent. Tested with CURL scripts, both block access to
    # Guitars and UserGuitars not created by the user who created them.
    @user_guitar = UserGuitar.create(guitar: @guitar, user: current_user, year: user_guitar_params['year'], price: user_guitar_params['price'])
    # @user_guitar = current_user.user_guitars.build(guitar: @guitar, user: current_user, year: user_guitar_params['year'], price: user_guitar_params['price'])

    if @user_guitar.save
      render json: @user_guitar, status: :created
    else
      render json: @user_guitar.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_guitars/1
  # PATCH/PUT /user_guitars/1.json
  def update
    if @user_guitar.update(user_guitar_params)
      render json: @user_guitar
    else
      render json: @user_guitar.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_guitars/1
  # DELETE /user_guitars/1.json
  def destroy
    @user_guitar.destroy

    head :no_content
  end

  def set_user_guitar
    @user_guitar = current_user.user_guitars.find(params[:id])
  end

  def guitar_params
    params.require(:guitar).permit(:make, :model)
  end

  def user_guitar_params
    params.require(:user_guitar).permit(:year, :price)
  end

  private :set_user_guitar, :user_guitar_params
end
