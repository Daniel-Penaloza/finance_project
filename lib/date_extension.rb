module DateExtension
  def self.predefined_date
    Time.use_zone('Mexico City') { Time.now.in_time_zone }
  end  
end
  