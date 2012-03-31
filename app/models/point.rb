# encoding: utf-8

# == Schema Information
#
# Table name: points
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

class Point < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :pool
  belongs_to :round
  
  def diff_total_pos_style_class
    if diff_total_pos > 0
      ' ranking-up '
    elsif diff_total_pos < 0
      ' ranking-down '
    else  # == 0
      ' '
    end
  end
  
  def diff_total_pos_str
    if diff_total_pos > 0
      "⇑#{diff_total_pos}"
    elsif diff_total_pos < 0
      "⇓#{diff_total_pos.abs}"
    else  # == 0
      ""
    end
  end

end  # class Point
