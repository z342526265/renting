# encoding: utf-8

require 'mechanize'
require 'active_support/all'
require 'active_record'
require "./create_table"
require "./config"
require "./text_process"

#连接数据库
ActiveRecord::Base.establish_connection(DATABASE_CONFIG)
#puts "删除一周前暂存的数据......"

#创建一个暂存数据的表
#CreateTable.new().change

#创建agent对象
a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Windows Mozilla'
}

link_arr = []

#58同城租房的url
url_58 = "http://ny.58.com/zufang/"

#获取链接地址
page = a.get(url_58)

page.links.each do |l|
  if l.dom_class.to_s == "t"
    link_arr << l.href
  end
end
link_arr.delete(link_arr.last)



link_arr.each do |link|
  #new_url = URI.escape(link.encode("gb2312"))
  new_page = a.get(link)
  next if new_page.blank?

  p new_page.class

  #处理基本房屋信息
  html_text = new_page.search("li").text

  #找到保存电话的图片
  img_url = new_page.search("span#t_phone img").attr("src").value

  @text_process = TextProcess.new(html_text)

  attrs = @text_process.attrs

  13.times do |i|
    puts "9999999999999999"
    puts i
    puts attrs[i]
  end

  {
      zujin:1500,

  }




  #获取保存电话号码的图片
  #p new_page.search("span#t_phone").class
  #p new_page.search("span")
  #p new_page.search("span#t_phone img")

  #找到保存电话号码的的图片的地址






  #保存到数据库
  #if @text_process.save_to_sql
  #  @text_process.save_to_csv
  #endif @text_process.save_to_sql
  #  @text_process.save_to_csv
  #end
  sleep 1000
end

puts Time.now.to_s + "抓取一遍"





