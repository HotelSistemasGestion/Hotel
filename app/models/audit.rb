class Audit < ActiveRecord::Base  

  filterrific(available_filters: [:sorted_by])
  scope :sorted_by, lambda { |tabla| where('audits.auditable_type = ?', tabla)}

end