class Task < ApplicationRecord
    validates :title, presence: true, length:{maximum: 20}
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :memo, length:{maximum: 500}
    validate :end_date_cannot_be_in_the_past
    def end_date_cannot_be_in_the_past
     if  start_date != nil && end_date != nil
        errors.add(:end_date, "終了日は開始日以降の日付にしてください") unless
        end_date > start_date
     end
    end
end
