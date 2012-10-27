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


  #显示更新时间
  def published_time_text(time)
    h = Time.now - time.to_time
    if h < 6.hours
      return "6小时以内"
    elsif h < 12.hours
      return "12小时以内"
    elsif h < 24.hours
      return "24小时以内"
    elsif h < 48.hours
      return "48小时以内"
    elsif h < 72.hours
      return "72小时以内"
    else
      return "超过三天"
    end
  end


end
