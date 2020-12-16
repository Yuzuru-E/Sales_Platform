class OperatingStatus < ActiveHash::Base
  include ActiveHash::Associations
  has_many :users
  
  self.data = [
    {id: 0, name: '未選択'}, {id: 1, name: '仕事できます'},
    {id: 2, name: '案件によります'}, {id: 3, name: '今は忙しいです'}
  ]
  
end