# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121008103730) do

  create_table "houses", :force => true do |t|
    t.integer  "user_id",          :limit => 8
    t.integer  "quyu_num",         :limit => 1
    t.integer  "cate_num",         :limit => 1
    t.integer  "chuzu_fangshi",    :limit => 1
    t.string   "biaoti"
    t.string   "dizhi"
    t.string   "xiaoqu"
    t.integer  "woshi",            :limit => 1
    t.integer  "keting",           :limit => 1
    t.integer  "chufang",          :limit => 1
    t.integer  "weishengjian",     :limit => 1
    t.integer  "leixing",          :limit => 1
    t.integer  "zhuangxiu",        :limit => 1
    t.integer  "louceng",          :limit => 1
    t.integer  "zongcengshu",      :limit => 1
    t.integer  "chaoxiang",        :limit => 1
    t.integer  "mianji",           :limit => 3
    t.integer  "zujin"
    t.integer  "fu_zujin_fangshi", :limit => 1
    t.string   "fangwu_peizhi"
    t.text     "miaoshu"
    t.string   "image_url"
    t.string   "lianxi_dianhu"
    t.string   "lianxi_ren"
    t.integer  "shuaxin_cishu",    :limit => 1
    t.boolean  "shifou_zhiding"
    t.boolean  "shifou_dingxiang"
    t.boolean  "shifou_tuiguang"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "cate",                   :default => 0
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
