RSpec::Matchers.define :have_fields do |*expected|
  match do |actual|
    @missing = expected - actual.fields
    @missing.none?
  end

  failure_message do |actual|
    "expected that #{actual.fields} would contain #{expected}, but #{@missing} is missing."
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
