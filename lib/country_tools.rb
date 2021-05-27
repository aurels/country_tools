module CountryTools
  def self.all_countries
    path = File.join(File.dirname(File.dirname(__FILE__)), 'names.yml')
    @@all_countries ||= YAML.load(File.read(path))
  end

  # https://en.wikipedia.org/wiki/European_Union
  EU_CODES = [
    'AT',       # Austria
    'BE',       # Belgium
    'BG',       # Bulgaria
    'HR',       # Croatia
    'CY',       # Cyprus
    'CZ',       # Czech Republic
    'DK',       # Denmark
    'EE',       # Estonia
    'FI',       # Finland
    'FR',       # France
    'DE',       # Germany
    'GR', 'EL', # Greece (https://fr.wikipedia.org/wiki/Union_europ%C3%A9enne#cite_ref-79)
    'HU',       # Hungary
    'IE',       # Ireland
    'IT',       # Italy
    'LV',       # Latvia
    'LT',       # Lithuania
    'LU',       # Luxembourg
    'MT',       # Malta
    'NL',       # Netherlands
    'PL',       # Poland
    'PT',       # Portugal
    'RO',       # Romania
    'SK',       # Slovakia
    'SI',       # Slovenia
    'ES',       # Spain
    'SE',       # Sweden
  ]

  def self.in_eu?(code)
    EU_CODES.include?(code)
  end

  def self.in_cee?(code)
    warn "[DEPRECATION] `in_cee?` is deprecated. Please use `in_eu?` instead."
    in_eu?(code)
  end

  def self.options_for_select
    all_countries.collect do |code, names|
      [names[I18n.locale.to_s], code]
    end.sort do |a, b|
      a.first <=> b.first
    end
  end

  def self.all_codes
    @@all_codes ||= all_countries.keys.sort
  end

  def self.name(code)
    if all_countries.has_key?(code.to_s)
      all_countries[code.to_s][I18n.locale.to_s]
    else
      code
    end
  end
end
