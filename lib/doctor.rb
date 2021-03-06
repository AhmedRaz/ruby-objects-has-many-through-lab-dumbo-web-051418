class Doctor

  @@all = []

  def self.all
    @@all
  end

  attr_accessor :name

  def initialize (name)
    @name = name
    @@all << self
  end

  def new_appointment (patient, date)
    Appointment.new(patient, self, date)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self
    end
  end

  def patients
    self.appointments.map {|appointment| appointment.patient}
  end

end
