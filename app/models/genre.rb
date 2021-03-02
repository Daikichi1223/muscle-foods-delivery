class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },{ id: 2, name: 'イタリアン' },{ id: 3, name: 'フレンチ' },
    { id: 4, name: 'スペイン料理' },{ id: 5, name: 'ブラジル料理' },{ id: 6, name: '中華料理' },
    { id: 7, name: '韓国料理' },{ id: 8, name: '洋食' },{ id: 9, name: 'ステーキ・グリル料理' },
    { id: 10, name: '洋食' },{ id: 11, name: '魚介・海鮮料理' },{ id: 13, name: '揚げ物' },
    { id: 14, name: '焼き鳥' },{ id: 15, name: '麺類' },{ id: 16, name: 'サラダ' },
    { id: 17, name: 'スイーツ' },{ id: 18, name: '飲み物' },{ id: 19, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :meals

  end