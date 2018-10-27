module GamesHelper
  def game_text
    if action_name == 'new'
      "【※テンプレートご自由にお使いください】\n集合場所：\n\n時間：\n受付 ：～\nスタート：～\n帰着申告：〜\n\nその他："
    else
      ""
    end
  end

  def label_all
    Label.all
  end


  def game_size
     label_all.where.not(game_size: nil)
  end

  def game_lebel
     label_all.where.not(game_lebel: nil)
  end

  def game_event
     label_all.where.not(game_event: nil)
  end
end
