class AisChecklistsController < ApplicationController
  # GET /ais_checklists
  # GET /ais_checklists.json
  def index
    @ais_checklists = AisChecklist.order("id").page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ais_checklists }
    end
  end

  # GET /ais_checklists/1
  # GET /ais_checklists/1.json
  def show
    @ais_checklist = AisChecklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ais_checklist }
    end
  end

  # GET /ais_checklists/new
  # GET /ais_checklists/new.json
  def new
    @ais_checklist = AisChecklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ais_checklist }
    end
  end

  # GET /ais_checklists/1/edit
  def edit
    @ais_checklist = AisChecklist.find(params[:id])
  end

  # POST /ais_checklists
  # POST /ais_checklists.json
  def create
    @ais_checklist = AisChecklist.new(params[:ais_checklist])

    respond_to do |format|
      if @ais_checklist.save
        format.html { redirect_to @ais_checklist, notice: 'Record was successfully created.' }
        format.json { render json: @ais_checklist, status: :created, location: @ais_checklist }
      else
        format.html { render action: "new" }
        format.json { render json: @ais_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ais_checklists/1
  # PUT /ais_checklists/1.json
  def update
    @ais_checklist = AisChecklist.find(params[:id])

    respond_to do |format|
      if @ais_checklist.update_attributes(params[:ais_checklist])
        format.html { redirect_to @ais_checklist, notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ais_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /@ais_checklists/1/are_you_sure
  def are_you_sure
    @ais_checklist = AisChecklist.find(params[:id])
  end

  # DELETE /ais_checklists/1
  # DELETE /ais_checklists/1.json
  def destroy
    @ais_checklist = AisChecklist.find(params[:id])
    @ais_checklist.destroy

    respond_to do |format|
      format.html { redirect_to ais_checklists_url, notice: 'Record was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def show_import
  end
  
  def import
    if params[:file] && params[:spring_term] && params[:summer_term] && params[:fall_term]
      AisChecklist.delete_all
      AisChecklist.import(params[:file], [params[:spring_term], params[:summer_term], params[:fall_term]])
      redirect_to ais_checklist_url, notice: "Records imported."
    else
      redirect_to show_import_ais_checklist_path, alert: "Please enter all terms and select a file."
    end
  end  

end
