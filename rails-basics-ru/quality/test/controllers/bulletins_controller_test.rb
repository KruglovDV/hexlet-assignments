require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'opens all bulletins page' do
    get bulletins_path

    assert_response :success
    bulletins.each do |bulletin|
      assert_select 'h4', bulletin.title
    end
  end

  test 'opens bulletin page' do
    first_bulletin = bulletins(:bulletin_1)
    get bulletin_path first_bulletin

    assert_select 'h4', first_bulletin.title
    assert_select 'p', first_bulletin.body
  end
end