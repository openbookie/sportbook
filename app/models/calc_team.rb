# == Schema Information
#
# Table name: teams
#
#  id           :integer         not null, primary key
#  title        :string(255)     not null
#  title2       :string(255)
#  key          :string(255)     not null
#  tag          :string(255)
#  synonyms     :string(255)
#  country_id   :integer         not null
#  city_id      :integer
#  club         :boolean         default(FALSE), not null
#  national     :boolean         default(FALSE), not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  img          :string(255)
#  type         :string(255)
#  calc         :boolean         default(FALSE), not null
#  calc_rule    :string(255)
#  calc_value   :string(255)
#  calc_team_id :integer
#


class CalcTeam < Team

  after_initialize :do_after_initialize

  def title
    "[#{read_attribute(:title)}]"   # wrap title in []
  end

private

  def do_after_initialize
    self.calc = true    # make sure calc flag is true
  end

    
end  # class CalcTeam
