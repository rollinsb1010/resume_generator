class Experience < ActiveRecord::Base
  belongs_to :resume

  validates :title, :presence => true
  validates :company, :presence => true
  validates :place, :presence => true
  validates :from_date, :presence => true

  validate :from_date_must_be_past
  validate :from_date_must_be_before_until_date


  acts_as_taggable_on :technologies


  def from_date_must_be_past
    errors.add(:from_date, "must be a past date") if self.from_date.present? && self.from_date > Date.today
  end

  def from_date_must_be_before_until_date
    return unless  self.from_date.present? && self.until_date.present? && self.until_date < self.from_date
    errors.add(:from_date, "must be before until_date")
    errors.add(:until_date, "must be after from date")
  end

end
