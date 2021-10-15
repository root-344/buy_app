class States < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '目立った傷はなし' },
    { id: 3, name: 'やや傷あり' },
    { id: 4, name: '傷あり' },
    { id: 5, name: '全体的に状態が悪い' },
  ]
  include ActiveHash::Associations
  has_many :items
end