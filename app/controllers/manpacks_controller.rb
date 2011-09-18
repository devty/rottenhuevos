require 'httparty'
class ManpacksController < ApplicationController

  # GET /manpacks
  # GET /manpacks.json
  def index
    @manpacks = Manpack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manpacks }
    end
  end

  # GET /manpacks/1
  # GET /manpacks/1.json
  def show
    @manpack = Manpack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manpack }
    end
  end

  # GET /manpacks/new
  # GET /manpacks/new.json
  def new
    @manpack = Manpack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manpack }
    end
  end

  # GET /manpacks/1/edit
  def edit
    @manpack = Manpack.find(params[:id])
  end

  # POST /manpacks
  # POST /manpacks.json
  def create
    @manpack = Manpack.new(params[:manpack])

    respond_to do |format|
      if @manpack.save
        format.html { redirect_to @manpack, notice: 'Manpack was successfully created.' }
        format.json { render json: @manpack, status: :created, location: @manpack }
      else
        format.html { render action: "new" }
        format.json { render json: @manpack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manpacks/1
  # PUT /manpacks/1.json
  def update
    @manpack = Manpack.find(params[:id])

    respond_to do |format|
      if @manpack.update_attributes(params[:manpack])
        format.html { redirect_to @manpack, notice: 'Manpack was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @manpack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manpacks/1
  # DELETE /manpacks/1.json
  def destroy
    @manpack = Manpack.find(params[:id])
    @manpack.destroy

    respond_to do |format|
      format.html { redirect_to manpacks_url }
      format.json { head :ok }
    end
  end
end
