FactoryBot.define do
  factory :cycle, class: Cycle do
    emp_duration_start { Date.today }
    emp_duration_end { Date.tomorrow }
    manager_duration_start { Date.today }
    manager_duration_end { Date.tomorrow }
    is_open { true }
  end
end