# frozen_string_literal: true

# == Schema Information
#
# Table name: staffs
#
#  id         :integer          not null, primary key
#  name       :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Staff < ApplicationRecord
  validates :name, presence: true, length: { in: 2..40 }
  validates :age, presence: true, numericality: { in: 18..70 }

  # after_create_commit -> { broadcast_append_to 'staffs', partial: 'staffs/staff', target: 'staffs', locals: { staff: self } }
  # after_create_commit -> { broadcast_append_to 'staffs', partial: 'staffs/staff', locals: { staff: self } }
  # after_create_commit -> { broadcast_append_to 'staffs' }
  # broadcasts_to ->(_staff) { 'staffs' }
  # broadcasts

  after_create_commit -> { broadcast_prepend_to 'staffs' }
  after_update_commit -> { broadcast_replace_to 'staffs' }
  after_destroy_commit -> { broadcast_remove_to 'staffs' }
end
