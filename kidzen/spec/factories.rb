FactoryGirl.define do

  # Factory for creating a permissions entity for a supervisor.
  # Authors: Ahmed H. Ismail.
  factory :parent_perm, class: Permission do
    abilities { { account_creation: true, supervisor: true, child: false } }
  end

  # Factory for creating a permissions entity for a child.
  # Authors: Ahmed H. Ismail.
  factory :child_perm, class: Permission do 
    abilities { { account_creation: false, supervisor: false, child: true } }
  end

  # Factory for creating a registered user entity
  # for a test supervisor.
  # Authors: Ahmed H. Ismail.
  factory :parent_user, class: RegisteredUser do 
    username "supervisor1"
    first_name "mohamed"
    middle_name "ibrahim"
    family_name "shabana"
    birth_date { 23.years.ago }
    gender "male"
    email "supervisor1@example.com"
    association :permission,  factory: :parent_perm
    password "foobar"
    password_confirmation "foobar"
    banned false
  end

  # Factory for creating a registered user entity
  # for a test child.
  # Authors: Ahmed H. Ismail.
  factory :child_user, class: RegisteredUser do
    username "child1"
    first_name "engy"
    middle_name "mohamed"
    family_name "shabana"
    birth_date { 16.years.ago }
    gender "female"
    email "child1@example.com"
    association :permission,  factory: :child_perm
    password "foobar"
    password_confirmation "foobar"
    banned false
  end

  # Factory for creating a supervisor entity.
  # Authors: Ahmed H. Ismail.
  factory :supervisor, class: Supervisor  do 
    association :registered_user, factory: :parent_user
  end

end