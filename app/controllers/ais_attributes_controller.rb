class AisAttributesController < ApplicationController
  # GET /ais_attributes
  # GET /ais_attributes.json
  def index
    @ais_attributes = AisAttribute.order("id").page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ais_attributes }
    end
  end

  # GET /ais_attributes/1
  # GET /ais_attributes/1.json
  def show
    @ais_attribute = AisAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ais_attribute }
    end
  end

  # GET /ais_attributes/new
  # GET /ais_attributes/new.json
  def new
    @ais_attribute = AisAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ais_attribute }
    end
  end

  # GET /ais_attributes/1/edit
  def edit
    @ais_attribute = AisAttribute.find(params[:id])
  end

  # POST /ais_attributes
  # POST /ais_attributes.json
  def create
    @ais_attribute = AisAttribute.new(params[:ais_attribute])

    respond_to do |format|
      if @ais_attribute.save
        format.html { redirect_to @ais_attribute, notice: 'Record was successfully created.' }
        format.json { render json: @ais_attribute, status: :created, location: @ais_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @ais_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ais_attributes/1
  # PUT /ais_attributes/1.json
  def update
    @ais_attribute = AisAttribute.find(params[:id])

    respond_to do |format|
      if @ais_attribute.update_attributes(params[:ais_attribute])
        format.html { redirect_to @ais_attribute, notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ais_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /ais_attributes/1/are_you_sure
  def are_you_sure
    @ais_attribute = AisAttribute.find(params[:id])
  end

  # DELETE /ais_attributes/1
  # DELETE /ais_attributes/1.json
  def destroy
    @ais_attribute = AisAttribute.find(params[:id])
    @ais_attribute.destroy

    respond_to do |format|
      format.html { redirect_to ais_attributes_url, notice: 'Record was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def show_import
  end
  
  def import
    if params[:file]
      AisAttribute.delete_all
      AisAttribute.import(params[:file])
      redirect_to ais_attributes_url, notice: "Records imported."
    else
      redirect_to ais_attributes_path, alert: "Please select a file."
    end
  end  

end
