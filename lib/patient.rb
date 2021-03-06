class Patient

  @@all = []

  def self.all
    @@all
  end
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment (doctor, date)
    Appointment.new(self, doctor, date)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.patient == self
    end
  end

  def doctors
    self.appointments.map {|appointment| appointment.doctor}
  end

end
