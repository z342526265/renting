require 'test_helper'

class HousesControllerTest < ActionController::TestCase
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post :create, house: { biaoti: @house.biaoti, chaoxiang: @house.chaoxiang, chufang: @house.chufang, chuzu_fangshi: @house.chuzu_fangshi, dizhi: @house.dizhi, fangwu_peizhi: @house.fangwu_peizhi, fu_zujin_fangshi: @house.fu_zujin_fangshi, image_url: @house.image_url, keting: @house.keting, leixing: @house.leixing, lianxi_dianhu: @house.lianxi_dianhu, lianxi_ren: @house.lianxi_ren, louceng: @house.louceng, mianji: @house.mianji, miaoshu: @house.miaoshu, shifou_dingxiang: @house.shifou_dingxiang, shifou_tuiguang: @house.shifou_tuiguang, shifou_zhiding: @house.shifou_zhiding, shuaxin_cishu: @house.shuaxin_cishu, user_id: @house.user_id, weishengjian: @house.weishengjian, woshi: @house.woshi, xiaoqu: @house.xiaoqu, zhuangxiu: @house.zhuangxiu, zongcengshu: @house.zongcengshu, zujin: @house.zujin }
    end

    assert_redirected_to house_path(assigns(:house))
  end

  test "should show house" do
    get :show, id: @house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @house
    assert_response :success
  end

  test "should update house" do
    put :update, id: @house, house: { biaoti: @house.biaoti, chaoxiang: @house.chaoxiang, chufang: @house.chufang, chuzu_fangshi: @house.chuzu_fangshi, dizhi: @house.dizhi, fangwu_peizhi: @house.fangwu_peizhi, fu_zujin_fangshi: @house.fu_zujin_fangshi, image_url: @house.image_url, keting: @house.keting, leixing: @house.leixing, lianxi_dianhu: @house.lianxi_dianhu, lianxi_ren: @house.lianxi_ren, louceng: @house.louceng, mianji: @house.mianji, miaoshu: @house.miaoshu, shifou_dingxiang: @house.shifou_dingxiang, shifou_tuiguang: @house.shifou_tuiguang, shifou_zhiding: @house.shifou_zhiding, shuaxin_cishu: @house.shuaxin_cishu, user_id: @house.user_id, weishengjian: @house.weishengjian, woshi: @house.woshi, xiaoqu: @house.xiaoqu, zhuangxiu: @house.zhuangxiu, zongcengshu: @house.zongcengshu, zujin: @house.zujin }
    assert_redirected_to house_path(assigns(:house))
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete :destroy, id: @house
    end

    assert_redirected_to houses_path
  end
end
