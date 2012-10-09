# encoding: utf-8
class House < ActiveRecord::Base

  attr_accessible :biaoti, :chaoxiang, :chufang, :chuzu_fangshi, :dizhi, :fangwu_peizhi, :fu_zujin_fangshi, :image_url, :keting, :leixing, :lianxi_dianhu, :lianxi_ren, :louceng, :mianji, :miaoshu, :shifou_dingxiang, :shifou_tuiguang, :shifou_zhiding, :shuaxin_cishu, :user_id, :weishengjian, :woshi, :xiaoqu, :zhuangxiu, :zongcengshu, :zujin





  LEIXING = []
  CHAOXIANG = [['东',0],['南',1],['西',2],['北',3],['其他',4]]
  CHUZU_FANGSHI = [['整租',0],['合租',1]]
  FU_ZUJIN_FANGSHI = [['押一付三',0],['半年付',1]]
  LEIXING = [['民房',0],['单元房',1]]
  ZHUANGXIU = [['简装修',0],['精装修',1],['毛坯房',2]]
  
end

