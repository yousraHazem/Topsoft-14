FactoryGirl.define do
  
  Factory :parent_perm, class: Permission do
    abilities { { account_creation: true, supervisor: true, child: false } }
  end

  Factory :child_perm, class: Permission do 
    abilities { { account_creation: false, supervisor: false, child: true } }
  end

  Factory :parent_user, class: RegisteredUser do 
    username "supervisor1"
    first_name "mohamed"
    middle_name "ibrahim"
    family_name "shabana"
    birth_date { 23.years.ago }
    gender "male"
    email "supervisor1@example.com"
    association :permission, factory: :parent_perm
    password "foobar"
    password_confirmation "foobar"
  end

  Factory :child_user, class: RegisteredUser do
    username "child1"
    first_name "engy"
    middle_name "mohamed"
    family_name "shabana"
    birth_date { 16.years.ago 0 }
    gender "female"
    email "child1@example.com"
    association :permission, factory: :child_perm
    password "foobar"
    password_confirmation "foobar"
  end

  Factory :supervisor, class  do 
    association :registered_user, factory: :parent_user
  end



end