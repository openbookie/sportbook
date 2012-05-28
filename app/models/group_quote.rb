
class GroupQuote < ActiveRecord::Base
  
  self.table_name = 'group_quotes'
  
  belongs_to :service
  belongs_to :group
  belongs_to :team
  
  def self.create_from_ary!( teams_with_odds, service, group )
    teams_with_odds.each do |values|
      GroupQuote.create!(
        :service => service,
        :group   => group,
        :team    => values[0],
        :odds    => values[1] )
    end # each team
  end
  

end  # class GroupQuote