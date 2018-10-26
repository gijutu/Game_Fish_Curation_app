module GamesHelper
  def game_text
    if action_name == 'new'
      "【※テンプレートご自由にお使いください】\n集合場所：\n\n時間：\n受付 ：～\nスタート：～\n帰着申告：〜\n\nその他："
    else
      ""
    end
  end
end
