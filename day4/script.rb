# frozen_string_literal: true

lines = File.open('input').readlines.map(&:strip)

REQUIRED = %w[
  byr
  iyr
  eyr
  hgt
  hcl
  ecl
  pid
].freeze

OPTIONAL = %w[cid].freeze

def validate_part1(passport)
  keys = passport.keys

  diff_keys = REQUIRED.difference keys

  return false unless diff_keys.include?(OPTIONAL) || diff_keys.empty?

  true
end

def validate_part2(passport)
  return false unless passport['byr'].size == 4
  return false unless (1920..2002).include?(Integer(passport['byr']))

  return false unless passport['iyr'].size == 4
  return false unless (2010..2020).include?(Integer(passport['iyr']))

  return false unless passport['eyr'].size == 4
  return false unless (2020..2030).include?(Integer(passport['eyr'].to_i))

  if passport['hgt'].end_with? 'cm'
    return false unless (150..193).include?(Integer(passport['hgt'].tr('cm', '')))
  elsif passport['hgt'].end_with? 'in'
    return false unless (59..76).include?(Integer(passport['hgt'].tr('in', '')))
  else
    return false
  end

  return false unless passport['hcl'].match(/#[0-9,a-f]{6}/)

  return false unless %w[amb blu brn gry grn hzl oth].include? passport['ecl']

  return false unless passport['pid'].size == 9

  true
end

passport = {}

valid_passports_part1 = []
valid_passports_part2 = []

lines.each do |line|
  elements = line.split

  elements.each do |element|
    key, value = element.split(':')
    passport[key] = value
  end

  next unless line.empty?

  valid_passports_part1.push passport if validate_part1(passport)
  valid_passports_part2.push passport if validate_part1(passport) && validate_part2(passport)
  passport = {} # reset collecting hash
end

puts valid_passports_part1.count
puts valid_passports_part2.count
