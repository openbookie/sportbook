module Lookup

=begin
  def self.kuv_stat_hash
    @@kuv_stat_hash ||= risbeskl_hash( 1001, 'KUV_STAT' )
  end

  def self.status_hash
    @@status_hash ||= risbeskl_hash( 126, 'STATUS' )
  end

  def self.zrhythmus_hash
    @@zrhythmus_hash ||= risbeskl_hash( 13, 'ZRHYTHMUS' )
  end
=end  

end