class PlayersController < ApplicationController
  def index
    @players = Player.order(:name)
  end

  def new
    @team = Team.find(params[:team_id])
    @player = Player.new
  end
  
  def create
    @player = Player.new(player_params)
    @player.team_id = params[:team_id]
    @team = @player.team
    if @player.save
      redirect_to team_path(@player.team_id)
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
    @team = @player.team
  end
  
  def update
    @player = Player.find(params[:id])
    @team = @player.team
    
    if @player.update_attributes(player_params)
      redirect_to @team
    else
      render :edit
    end
  end
  
  def destroy
    @player = Player.find(params[:id])
    @team = @player.team
    @player.destroy
    redirect_to @team
  end
  
  private
    def player_params
      params.require(:player).permit(:name, :position, :team_id)
    end
end
