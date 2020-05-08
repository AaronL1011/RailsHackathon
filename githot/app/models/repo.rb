class Repo < ApplicationRecord
    has_many :comments, dependent: :destroy
end