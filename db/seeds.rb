20.times do
  Staff.create(
    name: FFaker::Name.unique.name,
    age: (20..50).to_a.sample
  )
end
