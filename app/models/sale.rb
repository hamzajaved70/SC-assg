class Sale < ApplicationRecord
  belongs_to :user

  has_many :items
  
  accepts_nested_attributes_for :items, allow_destroy: true

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user}

  scope :approved, -> {where(approved: true)}

  def subtotals
    self.items.map { |i| i.subtotal }
  end

  def total_all
    subtotals.sum
  end

  def approve
    update(approved: true)
  end

  def disapprove
    update(approved: false)
  end
end
