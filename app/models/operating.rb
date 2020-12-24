class Operating < ActiveHash::Base
  include ActiveHash::Associations
  has_many :contractor
  
  self.data = [
    {id: 0, status: '未選択'}, {id: 1, status: '仕事できます'},
    {id: 2, status: '案件によります'}, {id: 3, status: '今は忙しいです'}
  ]
  
end