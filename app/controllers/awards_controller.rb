class AwardsController < ApplicationController
  def index
    @awards = Award.all
    @award  = Award.new
  end

  def show
    @award = Award.find(params[:id])
    @songs  = @award.songs
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
