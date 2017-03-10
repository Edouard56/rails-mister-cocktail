class DosesController < ApplicationController
  before_action :set_dose, only: [:new, :create, :destroy]

  def new
    @dose = Dose.new
  end

 def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'doses/new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_dose
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
   params.require(:dose).permit(:ingredient_id, :description)
  end

end