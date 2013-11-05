class AisTermsController < ApplicationController
  # GET /ais_terms
  # GET /ais_terms.json
  def index
    @ais_terms = AisTerm.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ais_terms }
    end
  end

  # GET /ais_terms/1
  # GET /ais_terms/1.json
  def show
    @ais_term = AisTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ais_term }
    end
  end

  # GET /ais_terms/new
  # GET /ais_terms/new.json
  def new
    @ais_term = AisTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ais_term }
    end
  end

  # GET /ais_terms/1/edit
  def edit
    @ais_term = AisTerm.find(params[:id])
  end

  # POST /ais_terms
  # POST /ais_terms.json
  def create
    @ais_term = AisTerm.new(params[:ais_term])

    respond_to do |format|
      if @ais_term.save
        format.html { redirect_to @ais_term, notice: 'Ais term was successfully created.' }
        format.json { render json: @ais_term, status: :created, location: @ais_term }
      else
        format.html { render action: "new" }
        format.json { render json: @ais_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ais_terms/1
  # PUT /ais_terms/1.json
  def update
    @ais_term = AisTerm.find(params[:id])

    respond_to do |format|
      if @ais_term.update_attributes(params[:ais_term])
        format.html { redirect_to @ais_term, notice: 'Ais term was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ais_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /@ais_checklists/1/delete
  def delete
    @ais_term = AisTerm.find(params[:id])
  end

  # DELETE /ais_terms/1
  # DELETE /ais_terms/1.json
  def destroy
    @ais_term = AisTerm.find(params[:id])
    @ais_term.destroy

    respond_to do |format|
      format.html { redirect_to ais_terms_url }
      format.json { head :no_content }
    end
  end
end
