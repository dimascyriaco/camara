RSpec::Matchers.define :have_fields do |expected|
  match do |actual|
    actual.fields.include? *expected
  end
end
