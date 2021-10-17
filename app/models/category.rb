class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '根菜類（大根、人参、れんこん、いも類など）' },
    { id: 3, name: '葉茎菜類（白菜、キャベツ、レタス、ネギ、玉ねぎ、ブロッコリーなど）' },
    { id: 4, name: '果菜類（きゅうり、なす、トマト、ピーマン、とうもろこし、豆類など）' },
    { id: 5, name: '果実類（いちご、メロン、スイカ、りんごなど）' },
    { id: 6, name: '香辛類（しょうがなど）' }
  ]
  include ActiveHash::Associations
  has_many :items
end
