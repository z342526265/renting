# encoding: utf-8
class House < ActiveRecord::Base

  attr_accessible :biaoti, :chaoxiang, :chufang, :chuzu_fangshi, :dizhi, :fangwu_peizhi, :fu_zujin_fangshi, :image_url,
                  :keting, :leixing, :lianxi_dianhu, :lianxi_ren, :louceng, :mianji, :miaoshu, :shifou_dingxiang,
                  :shifou_tuiguang, :shifou_zhiding, :shuaxin_cishu, :user_id, :weishengjian, :woshi, :xiaoqu,
                  :zhuangxiu, :zongcengshu, :zujin,:cate_num,:quyu_num,:img_url,:ruzhu,:craw_url


belongs_to :user


  validates_uniqueness_of :craw_url

  CATE_NUM = [["个人",0],["经纪人",1]]
  LEIXING = []

#  <option value="" selected="selected">选择朝向</option>
#<option value="1">东</option>
#  <option value="2">南</option>
#<option value="3">西</option>
#  <option value="4">北</option>
#<option value="5">南北</option>
#  <option value="6">东西</option>
#<option value="7">东南</option>
#  <option value="8">西南</option>
#<option value="9">东北</option>
#  <option value="10">西北</option>
  CHAOXIANG_58 = %w(东 南 西 北 南北 东西 东南 西南 东北 西北)
  CHAOXIANG = Array.new(CHAOXIANG_58.length){|i|[CHAOXIANG_58[i],i]}


  CHUZU_FANGSHI = [['整租',0],['合租',1]]

  #58同城的付租金方式
  FU_ZUJIN_FANGSHI_58 = %w(面议 押一付三 押一付一 押二付一 半年付 年付)
  FU_ZUJIN_FANGSHI = Array.new(FU_ZUJIN_FANGSHI_58.length){|i|[FU_ZUJIN_FANGSHI_58[i],i]}

  LEIXING_58 = %w(平房 普通住宅 商住两用 公寓 别墅 其他)
  LEIXING = Array.new(LEIXING_58.length){|i|[LEIXING_58[i],i]}

  ZHUANGXIU_58 = %w(毛坯 简单装修 中等装修 精装修 豪华装修)
  ZHUANGXIU = Array.new(ZHUANGXIU_58.length){|i|[ZHUANGXIU_58[i],i]}


  FANGWU_PEIZHI = %w(床 热水器 洗衣机 空调 冰箱 电视 宽带 沙发 衣柜 桌子 暖气 微波炉 电梯 门禁 车位)

  QUYU_NUM_58 = %w(卧龙 宛城 邓州 南召 方城 西峡 镇平 内乡 淅川 社旗 唐河 新野 桐柏 油田 其他)
  QUYU_NUM = Array.new(QUYU_NUM_58.length){|i|[QUYU_NUM_58[i],i]}

  #每页数量
  PER_PAGE_COUNT = 30

  #
  #QUYU_NUM = [
  #    ["卧龙",0],
  #    ["宛城",1],
  #    ["邓州",2],
  #    ["南召",3],
  #    ["方城",4],
  #    ["西峡",5],
  #    ["镇平",6],
  #    ["内乡",7],
  #    ["淅川",8],
  #    ["社旗",9],
  #    ["唐河",10],
  #    ["新野",11],
  #    ["桐柏",12],
  #    ["油田",13],
  #    ["其他",14]
  #]

  #def user_cate
  #  self.user.try :cate
  #end
  #
  #def user_cate=(cate)
  #  User.current.cate = cate
  #end

  #房屋配置
  def fangwu_peizhi=(val)
    val = val.join(",") if val.is_a? Array
    write_attribute("fangwu_peizhi",val) if val.present?
  end


  def quyu_text
    QUYU_NUM[self.quyu_num].first rescue "-"
  end

  def cate_text
    CATE_NUM[self.cate_num].first rescue "-"
  end

  def huxing
    txt = ""
    txt << "#{woshi}室" if woshi > 0
    txt << "#{keting}厅" if keting > 0
    txt << "#{chufang}厨" if chufang > 0
    txt << "#{weishengjian}卫" if weishengjian > 0
    return txt
  end


  before_create :set_published_at

  def set_published_at
    self.published_at = Time.now
  end

end


