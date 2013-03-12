class TeamsController < ApplicationController

 before_filter :authenticate_user!
 respond_to :html

 
  def index
    @teams = current_user.teams
    @team_members = current_user.team_members
    @active_team_members = get_active_team_members
    @inactive_team_members = get_inactive_members
  end

  def show
    @team = Team.find(params[:id])
  end

  def single
   
  end

  def get_active_team_members
    @active_team_members = User.where("invitation_accepted_at != ? AND invited_by_id = ?", :nil, current_user.id)
  end

  def get_inactive_members
    @invited_members = User.where('invited_by_id = ? AND invitation_accepted_at = ?', current_user.id, :nil)
  end
  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @team = Team.new
  end

  # GET /tasks/1/edita
  def edit
    @team = Team.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
   
    @team = current_user.teams.new(params[:task])
    
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Task was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @team = current_user.teams.find(params[:id])
    params[:status].delete(:user_id) if params[:team].has_key?(:user_id)

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team/1
  # DELETE /teams/1.json

  def delete_member

  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

end
