class TeamsController < ApplicationController

  before_action "load_team", :only => [:edit, :update, :show, :destroy]

  def index
    @teams = Team.order(:name)
  end

  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end
  
  def edit
    # @team = Team.find(params[:id])
  end
  
  def update
    if @team.update_attributes(team_params)
      redirect_to teams_path
    else
      render :edit
    end
  end

  def show
    # @team = Team.find(params[:id])
  end
  
  def destroy
    @team.destroy
    redirect_to Team
  end
  
  private
  
    # Whitelist the acceptable paramaters
    def team_params
      params.require(:team).permit(:name)
    end
    
    def load_team
      @team = Team.find(params[:id])
    end
end
