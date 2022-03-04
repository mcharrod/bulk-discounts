class HolidayFacade
  def self.next_holidays
    service.holidays.map do |data|
      Holiday.new(data)
    end
  end

  def self.service
    HolidayService.new
  end
end
