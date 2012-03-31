# encoding: utf-8

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