# encoding: utf-8
module HousesHelper

  #已选条件
  #根据sessions[:conditions]显示出已选条件
  def selected_txt(key,val)
    val = val.to_i
    case key
      when "quyu"
        return House::QUYU_NUM_58[val] || "全部"
      when "zujin"
        return House::ZUJIN_CATE[val] || "不限"
      when "keting"
        return House::TINGSHI[val] || "不限"
      when "fangshi"
        return House::CHUZU_FANGSHI_58[val] || "不限"
    end
  end




end
