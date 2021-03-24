class Category < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '基礎練習' },
      { id: 3, name: '技術練習' },
      { id: 4, name: '筋力トレーニング' },
      { id: 5, name: '練習試合' },
      { id: 6, name: '公式戦' },
    ]
    end