# encoding: utf-8
class House < ActiveRecord::Base

  attr_accessible :biaoti, :chaoxiang, :chufang, :chuzu_fangshi, :dizhi, :fangwu_peizhi, :fu_zujin_fangshi, :image_url,
                  :keting, :leixing, :lianxi_dianhu, :lianxi_ren, :louceng, :mianji, :miaoshu, :shifou_dingxiang,
                  :shifou_tuiguang, :shifou_zhiding, :shuaxin_cishu, :user_id, :weishengjian, :woshi, :xiaoqu,
                  :zhuangxiu, :zongcengshu, :zujin,:cate_num,:quyu_num


belongs_to :user

  CATE_NUM = [["个人",0],["经纪人",1]]
  LEIXING = []
  CHAOXIANG = [['东',0],['南',1],['西',2],['北',3],['其他',4]]
  CHUZU_FANGSHI = [['整租',0],['合租',1]]
  FU_ZUJIN_FANGSHI = [['押一付三',0],['半年付',1]]
  LEIXING = [['民房',0],['单元房',1]]
  ZHUANGXIU = [['简装修',0],['精装修',1],['毛坯房',2]]
  FANGWU_PEIZHI = %w(床 热水器 洗衣机 空调 冰箱 电视 宽带 沙发 衣柜 桌子 暖气 微波炉 电梯 门禁 车位)


  QUYU_NUM = [
      ["卧龙",0],
      ["宛城",1],
      ["邓州",2],
      ["南召",3],
      ["方城",4],
      ["西峡",5],
      ["镇平",6],
      ["内乡",7],
      ["淅川",8],
      ["社旗",9],
      ["唐河",10],
      ["新野",11],
      ["桐柏",12],
      ["油田",13],
      ["其他",14]
  ]

  #def user_cate
  #  self.user.try :cate
  #end
  #
  #def user_cate=(cate)
  #  User.current.cate = cate
  #end

  #房屋配置
  def fangwu_peizhi=(val)
    write_attribute("fangwu_peizhi",val.join(","))
  end


  def quyu_text
    QUYU_NUM[self.quyu_num].first
  end

  def cate_text
    CATE_NUM[self.cate_num].first
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


