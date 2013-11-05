class AisApplicationCommentsController < ApplicationController
  # GET /ais_application_comments
  # GET /ais_application_comments.json
  def index
    @ais_application_comments = AisApplicationComment.order("id").page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ais_application_comments }
    end
  end

  # GET /ais_application_comments/1
  # GET /ais_application_comments/1.json
  def show
    @ais_application_comment = AisApplicationComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ais_application_comment }
    end
  end

  # GET /ais_application_comments/new
  # GET /ais_application_comments/new.json
  def new
    @ais_application_comment = AisApplicationComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ais_application_comment }
    end
  end

  # GET /ais_application_comments/1/edit
  def edit
    @ais_application_comment = AisApplicationComment.find(params[:id])
  end

  # POST /ais_application_comments
  # POST /ais_application_comments.json
  def create
    @ais_application_comment = AisApplicationComment.new(params[:ais_application_comment])

    respond_to do |format|
      if @ais_application_comment.save
        format.html { redirect_to @ais_application_comment, notice: 'Record was successfully created.' }
        format.json { render json: @ais_application_comment, status: :created, location: @ais_application_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @ais_application_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ais_application_comments/1
  # PUT /ais_application_comments/1.json
  def update
    @ais_application_comment = AisApplicationComment.find(params[:id])

    respond_to do |format|
      if @ais_application_comment.update_attributes(params[:ais_application_comment])
        format.html { redirect_to @ais_application_comment, notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ais_application_comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /ais_application_comments/1/are_you_sure
  def are_you_sure
    @ais_application_comment = AisApplicationComment.find(params[:id])
  end

  # DELETE /ais_application_comments/1
  # DELETE /ais_application_comments/1.json
  def destroy
    @ais_application_comment = AisApplicationComment.find(params[:id])
    @ais_application_comment.destroy

    respond_to do |format|
      format.html { redirect_to ais_application_comments_url, notice: 'Record was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def show_import
  end
  
  def import
    if params[:file] && params[:spring_term] && params[:summer_term] && params[:fall_term]
      AisApplicationComment.delete_all
      AisApplicationComment.import(params[:file], [params[:spring_term], params[:summer_term], params[:fall_term]])
      redirect_to ais_application_comments_url, notice: "Records imported."
    else
      redirect_to show_import_ais_application_comments_path, alert: "Please enter all terms and select a file."
    end
  end  
  
end
