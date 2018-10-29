module GamesHelper
  def game_text
    if action_name == 'new'
      "例：※集合場所、集合時間、受付時間などの当日の動き　※大会のルールなどを記入してください"
    else
      ""
    end
  end
end
