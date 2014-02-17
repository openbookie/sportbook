# == Schema Information
#
# Table name: bonus_points
#
#  id             :integer         not null, primary key
#  user_id        :integer         not null
#  pool_id        :integer         not null
#  round_id       :integer         not null
#  round_pts      :integer         default(0), not null
#  round_pos      :integer         default(0), not null
#  total_pts      :integer         default(0), not null
#  total_pos      :integer         default(0), not null
#  diff_total_pos :integer         default(0), not null
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

BonusPoint = SportDb::Model::BonusPoint
