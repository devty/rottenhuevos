class ManbagAccountsController < ApplicationController
  # GET /manbag_accounts
  # GET /manbag_accounts.json
  def index
    @manbag_accounts = ManbagAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manbag_accounts }
    end
  end

  # GET /manbag_accounts/1
  # GET /manbag_accounts/1.json
  def show
    @manbag_account = ManbagAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manbag_account }
    end
  end

  # GET /manbag_accounts/new
  # GET /manbag_accounts/new.json
  def new
    @manbag_account = ManbagAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manbag_account }
    end
  end

  # GET /manbag_accounts/1/edit
  def edit
    @manbag_account = ManbagAccount.find(params[:id])
  end

  # POST /manbag_accounts
  # POST /manbag_accounts.json
  def create
    @manbag_account = ManbagAccount.new(params[:manbag_account])

    respond_to do |format|
      if @manbag_account.save
        format.html { redirect_to @manbag_account, notice: 'Manbag account was successfully created.' }
        format.json { render json: @manbag_account, status: :created, location: @manbag_account }
      else
        format.html { render action: "new" }
        format.json { render json: @manbag_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manbag_accounts/1
  # PUT /manbag_accounts/1.json
  def update
    @manbag_account = ManbagAccount.find(params[:id])

    respond_to do |format|
      if @manbag_account.update_attributes(params[:manbag_account])
        format.html { redirect_to @manbag_account, notice: 'Manbag account was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @manbag_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manbag_accounts/1
  # DELETE /manbag_accounts/1.json
  def destroy
    @manbag_account = ManbagAccount.find(params[:id])
    @manbag_account.destroy

    respond_to do |format|
      format.html { redirect_to manbag_accounts_url }
      format.json { head :ok }
    end
  end
end
