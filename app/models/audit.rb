class Audit < ActiveRecord::Base  

  filterrific(available_filters: [:sorted_by, :created_at_lt, :sorted_by_nombre])
  scope :sorted_by, lambda { |tabla| where('audits.auditable_type = ?', tabla)}
  scope :created_at_lt, lambda { |reference_time| where('audits.created_at <= ?', reference_time)}
  scope :sorted_by_nombre, lambda { |nombre| where('audits.username <= ?', nombre)}

end