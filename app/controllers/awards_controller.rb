class AwardsController < ApplicationController
  def index
    @awards = Award.all
  end

  def show
    @award = Award.find(params[:id])
  end

  def new
    @award = Award.new
  end

  def create
    Award.create(award_params)
    redirect_to awards_path
  end

  private

  def award_params
    params.require(:award).permit(:name)
  end
end
