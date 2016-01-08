class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :contact_id, uniqueness: { scope: :user_id }

  belongs_to :user,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :contact,
    class_name: "Contact",
    primary_key: :id,
    foreign_key: :contact_id
end
