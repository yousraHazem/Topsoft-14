class Question < ActiveRecord::Base
  belongs_to :new_survey
  has_many :ranks, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :pic_models, dependent: :destroy
  has_many :range_sliders, dependent: :destroy
  accepts_nested_attributes_for :ranks, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :pic_models, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :range_sliders, :reject_if => :all_blank, :allow_destroy => true
end
