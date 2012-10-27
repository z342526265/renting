# encoding: utf-8
class HousesController < ApplicationController
  before_filter :authenticate_user!,:only=>[:new,:create,:edit,:update,:destroy]

  # GET /houses
  # GET /houses.json
  def index

    session["conditions"] ||= {}

    if params["s"]
      session["conditions"].delete(params["s"])
    else
      new_conditions = params.delete_if{|key,val| ["controller","action","s"].include?(key)}
      session["conditions"].update new_conditions
    end

    @houses = House.where("lianxi_dianhu is not ?",nil)

    #区域条件
    quyu = session["conditions"]["quyu"]
    if quyu
      @houses = @houses.where("quyu_num = ?",quyu)
    end

    #租金条件
    zujin = session[:conditions]["zujin"]
    if zujin.present?
      zujin = zujin.to_i
      zujin_cate = House::ZUJIN_CATE
      txt = zujin_cate[zujin]
      if zujin == 0
        @houses = @houses.where("zujin <= ?",txt[/\d+/])
      elsif zujin + 1 == zujin_cate.length
        @houses = @houses.where("zujin > ?",txt[/\d+/])
      else
        a = /(\d+)-(\d+)元/.match txt
        @houses = @houses.where("zujin between ? and ?",a[1],a[2])
      end
    end

    #厅室数量条件
    tingshi = session["conditions"]["keting"]
    if tingshi
      tingshi = tingshi.to_i
      if tingshi + 1 == House::TINGSHI.length
        @houses = @houses.where("woshi > ?",tingshi)
      else
        @houses = @houses.where("woshi = ?",tingshi + 1)
      end
    end

    #出租方式条件
    fangshi = session["conditions"]["fangshi"]
    if fangshi
      @houses = @houses.where("chuzu_fangshi = ?",fangshi)
    end

    @houses = @houses.page(params[:page]).per(House::PER_PAGE_COUNT).order("updated_at desc")

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
end
