class Matter < ApplicationRecord
  belongs_to :client
  belongs_to :contractor, optional: true
  belongs_to :industry

  with_options presence: true do
    validates :client_id
    validates :title
    validates :matter_content
    validates :start_on
    validates :end_on
    validates :contract_period
    validates :industry_id
    validates :reward
    validates :number_of_positions
  end

end
