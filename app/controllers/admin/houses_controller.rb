# encoding: utf-8
class Admin::HousesController < Admin::Application

  before_filter :authenticate_user!,:only=>[:new,:create,:edit,:update,:destroy]

  # GET /houses
  # GET /houses.json
  def index

    @houses = House.page(params[:page]).per(House::PER_PAGE_COUNT)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @houses }
    end
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
    @house = House.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/new
  # GET /houses/new.json
  def new
    @house = current_user.houses.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/1/edit
  def edit
    @house = House.find(params[:id])
  end

  # POST /houses
  # POST /houses.json
  def create

    @house = current_user.houses.build(params[:house])

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: '出租信息发布成功！' }
        format.json { render json: @house, status: :created, location: @house }
      else
        format.html { render action: "new" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /houses/1
  # PUT /houses/1.json
  def update
    @house = House.find(params[:id])

    respond_to do |format|
      if @house.update_attributes(params[:house])
        format.html { redirect_to @house, notice: '信息已经更新！' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house = House.find(params[:id])
    @house.destroy

    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end

  def price_images
    @houses = House.where("zujin = ?",nil)
  end


end
