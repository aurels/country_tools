module CountryTools
  def self.all_countries
    path = File.join(File.dirname(File.dirname(__FILE__)), 'names.yml')
    @@all_countries ||= YAML.load(File.read(path))
  end
  
  CEE_CODES = %w[ DE AT BE BG CY DK ES EE FI FR EL HU IE IT LV LT LU MT NL PL PT GB RO SK SI SE CZ ]

  def self.in_cee?(code)
    all_countries.include?(code)
  end
  
  def self.options_for_select
    all_countries.collect do |code, names|
      [names[I18n.locale.to_s], code]
    end.sort_by do |a, b|
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