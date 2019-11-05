class WebcodesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_webcode, only: [:show, :edit, :update, :destroy]
    require 'webcodes_helper'
  attr_accessor :webcode
  # GET /webcodes
  # GET /webcodes.json
  def index
    @webcodes = Webcode.all
  end

  # GET /webcodes/1
  # GET /webcodes/1.json
  def show
  end

  # GET /webcodes/new
  def new
    @webcode = Webcode.new
  end

  # GET /webcodes/1/edit
  def edit
  end

  # POST /webcodes
  # POST /webcodes.json
  def create
    @webcode = Webcode.new(webcode_params) 
    respond_to do |format|
      if @webcode.save
        @mywebsite = UploadController.new(webcode)
         format.html { redirect_to @webcode }
         format.json { render :show, status: :created, location: @webcode}  
    
         
      else
        format.html { render :new }
        format.json { render json: @webcode.errors, status: :unprocessable_entity }
      end
     
    end
  end

  # PATCH/PUT /webcodes/1
  # PATCH/PUT /webcodes/1.json
  def update
    respond_to do |format|
      if @webcode.update(webcode_params)
        format.html { redirect_to @webcode, notice: 'Webcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @webcode }
      else
        format.html { render :edit }
        format.json { render json: @webcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webcodes/1
  # DELETE /webcodes/1.json
  def destroy
    @webcode.destroy
    respond_to do |format|
      format.html { redirect_to webcodes_url, notice: 'Webcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webcode
      @webcode = Webcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def webcode_params
      params.require(:webcode).permit(:bottom_l, :bottom_m, :bottom_r, :middle_l, :middle_m, :middle_r, :top_l, :top_m, :top_r, :firstRow, :secondRow, :thirdRow)
    end
end
