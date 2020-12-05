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

passport = {}

valid_passports_part1 = []

lines.each do |line|
  elements = line.split

  elements.each do |element|
    key, value = element.split(':')
    passport[key] = value
  end

  if line.empty?
    valid_passports_part1.push passport if validate_part1(passport)
    passport = {} # reset collecting hash
  end
end

puts valid_passports_part1.count
