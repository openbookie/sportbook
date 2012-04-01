# encoding: utf-8

module Lookup

  def self.team_options_for_event( event )
    [[ '- Team wählen -', nil ]] + event.teams.all.map { |rec| [ rec.title, rec.id ] }
  end

=begin
  def self.status_hash
    @@status_hash ||= find_status_hash( 111, 'STATUS' )
  end
=end  

end