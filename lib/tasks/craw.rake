# encoding: utf-8
namespace :craw do

  #抓取58同城页面资料的rake任务

  task :craw_58=>:environment do

    require 'mechanize'

    #puts "删除一周前暂存的数据......"


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
      next if House.find_by_craw_url(link).present?
      attrs = {}
      attrs[:craw_url] = link
      #new_url = URI.escape(link.encode("gb2312"))
      new_page = a.get(link)
      next if new_page.blank?
      p "999999"
      biaoti = new_page.search("div.headline h1").text
      p biaoti
      img_url = new_page.search("span#t_phone img").attr("src").value rescue nil
      p img_url

      lianxi_ren = new_page.search("li.ico_user a").text
      p new_page.search("ul li#movebar_info").text
      p new_page.search("a").text
      p new_page.search("ul.userinfo")
      p new_page.search("li.ico_user")
      new_page.search("li.ico_user a")
      p lianxi_ren

      attrs[:lianxi_ren] = lianxi_ren

      p "dddddddddddddddddddddddddddddddddddddddddddddddddddd"
      miaoshu = new_page.search("div.maincon").text.gsub(/\s/,"")
      p miaoshu
      attrs[:biaoti] = biaoti
      attrs[:img_url] = img_url
      attrs[:miaoshu] = miaoshu

      ul = new_page.search("div.infotxt ul")
      p "00000000000"
      p ul.search("span.pri").text
      attrs[:zujin] = ul.search("span.pri").text
      fu_zujin_fangshi = ul.search("span.huit").text
      attrs[:fu_zujin_fangshi] = House::FU_ZUJIN_FANGSHI_58.index(fu_zujin_fangshi)
      p "99999999999"
      li = ul.search("li")
      i = 1
      ruzhu = li[i].text.gsub(/入　住：/,"")
      if li[i].text.match(/入　住：/)
        attrs[:ruzhu] = ruzhu
        i = i + 1
      end
      p i
      huxing = li[i].text.gsub(/户　型：/,'')
      if li[i].text.match(/户　型：/)
        huxing_arr = huxing.split("　")
        p huxing
        p huxing_arr.first
        huxing_match = huxing_arr.first.match(/(\d)室(\d)厅(\d)卫/)
        p huxing_match
        attrs[:woshi] = huxing_match[1]
        attrs[:keting] = huxing_match[2]
        attrs[:weishengjian] = huxing_match[3]
        attrs[:mianji] = huxing_arr.second.gsub(/[^\d]/,"")

        i += 1
      end
       p i
      p "-----------"
      leixing = li[i].text.gsub(/类　型：|朝向/,"")
      if li[i].text.match(/类　型：/)
        leixing_arr = leixing.split("　")
        attrs[:louceng] = leixing_arr[-2][/\d/]
        attrs[:zongcengshu] = leixing_arr[-1][/\d/]

        new_leixing_arr = leixing_arr - leixing_arr[-2,2]
        p new_leixing_arr
        new_leixing_arr.each do |l|
          leixing = House::LEIXING_58.index(l)
          zhuangxiu = House::ZHUANGXIU_58.index(l)
          chaoxiang = House::CHAOXIANG_58.index(l)
          if leixing.present?
            attrs[:leixing] = leixing
          elsif zhuangxiu.present?
            attrs[:zhuangxiu] = zhuangxiu
          elsif chaoxiang.present?
            attrs[:chaoxiang] = chaoxiang
          end
        end

        i += 1
      end


      #attrs[:leixing] = House::LEIXING_58.index(leixing_arr[0])
      #p leixing_arr
      #
      #attrs[:zhuangxiu] = House::ZHUANGXIU_58.index(leixing_arr[1])
      #attrs[:chaoxiang] = House::CHAOXING_58.index(leixing_arr[2])
      #leixing_arr
      p i
      p li[i]
      puts li[i].text
      if li[i].text.match(/配　置：/)
        peizhi = /\'(.*?)\'/.match(li[i].text)
        attrs[:fangwu_peizhi] = peizhi[1]
        i=i+1
      end
      p attrs[:fangwu_peizhi]
      p "kkkkkkkkkkk"
      if li[i] && li[i].text.match(/区　域：/)
        quyu_text = li[i].text.gsub(/区　域：|/,'')
        quyu_text.gsub!(/ | /,"")
        p quyu_text
        attrs[:quyu_num] = House::QUYU_NUM_58.index(quyu_text)
        p attrs[:quyu_num]

        i += 1

      end


      p "33333333333333333"
      if li[i] && li[i].text.match(/小　区：/)
        attrs[:xiaoqu] = li[i].text.gsub(/小　区：|\s/,'')

        i += 1
      end

      if li[i].present? && li[i].text.match(/地　址：/)
        attrs[:dizhi] = li[i].text.gsub(/地　址：|\s/,'')
        i += 1
      end

      p i

      #p li[1].text
      #p li[2].text
      #p li[3].text
      #p li[4].text
      #p li[5].text
      #p li[6].text
      #p li[7].text
      #p li[8].text
      #p li[9].text
      #p li[10].text
      #p li[11].text
      #p li[12].text

      p attrs

      house = House.new(attrs)
      house.save


      sleep 3
    end

    puts Time.now.to_s + "抓取一遍"


  end


end