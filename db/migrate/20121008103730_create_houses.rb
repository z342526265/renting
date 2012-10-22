class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.integer :user_id,:limit=>6

      t.integer :quyu_num,:limit=>1,default:0  #区域编号
      t.integer :cate_num,:limit=>1,default:0  #发布者身份 0个人 1经纪人

      t.integer :chuzu_fangshi,:limit=>1,default:0
      t.string :biaoti
      t.string :dizhi
      t.string :xiaoqu
      t.integer :woshi,:limit=>1,default:0
      t.integer :keting,:limit=>1,default:0
      t.integer :chufang,:limit=>1,default:0
      t.integer :weishengjian,:limit=>1,default:0
      t.integer :leixing,:limit=>1,default:0
      t.integer :zhuangxiu,:limit=>1,default:0
      t.integer :louceng,:limit=>1,default:0
      t.integer :zongcengshu,:limit=>1,default:0
      t.integer :chaoxiang,:limit=>1,default:0
      t.integer :mianji,:limit=>3
      t.integer :zujin,:limit=>4
      t.integer :fu_zujin_fangshi,:limit=>1,default:0
      t.string :fangwu_peizhi
      t.text :miaoshu
      t.string :image_url
      t.string :lianxi_dianhu
      t.string :lianxi_ren
      t.integer :shuaxin_cishu,:limit=>1,default:0
      t.boolean :shifou_zhiding
      t.boolean :shifou_dingxiang
      t.boolean :shifou_tuiguang

      t.datetime :published_at  #发布时间

      t.timestamps
    end
  end
end
