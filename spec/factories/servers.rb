FactoryGirl.define do
  factory :server do
    name "Server1"
    cpu "CPU val"
    drive "200 GO"
    ram "5 GO"
    os "Ubuntu"
    os_type "64 bits"
    applications "MySQL, Nginx"
  end
end
