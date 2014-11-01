RSpec::Matchers.define :have_fields do |expected|
  match do |actual|
    actual.fields && actual.fields.include?(*expected)
  end
end

RSpec::Matchers.define :have_field do |expected, options|
  match do |actual|
    field = nil
    actual.fields.find do |f|
      key = f.is_a?(Hash) && f.keys.find {|k| k == expected }
      field = f[key] if key
    end
    field && field == options[:as_class]
  end
end
