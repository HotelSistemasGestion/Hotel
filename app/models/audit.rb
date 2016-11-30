class Audit < ActiveRecord::Base
  #paginates_per 2
  filterrific(available_filters: [:sorted_by])

  #scope :sorted_by, lambda { |nombre|where(:nombre => [*nombre])}

  scope :sorted_by, lambda { |tabla| where('audits.auditable_type = ?', tabla)}
  #scope :sorted_by_apellido, lambda { |apellido| where('reservations.apellido = ?', apellido)}

end