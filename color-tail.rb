# encoding: utf-8
require "rubygems"
require "eventmachine"
require "eventmachine-tail"
require 'term/ansicolor'
require 'digest/sha1'


AVAILABLE_COLORS = Term::ANSIColor::ATTRIBUTES.select {|k,v| v >= 30 and k.to_s !~ /white/ }.map(&:first)
SQUARE = %w{∎ ❚ ❙ ❘ } # TODO pick one

# TODO / FIXME test this
class C
  extend ::Term::ANSIColor
  def self.pref(color, str)
    "#{SQUARE.first}#{self.send color}#{str}#{clear}#{SQUARE.first}"
  end
end

# TODO use trollop
def main(args)
  if args.length == 0
    puts "Usage: #{$0} <path> [path2] [...]"
    return 1
  end

  EventMachine.run do
    args.each do |path|

      f_hash = Digest::SHA1.hexdigest(path)[0..6]
      color_prefix = C.pref(AVAILABLE_COLORS[srand().to_s[0].to_i], f_hash)
      puts "#{path} marked with #{color_prefix}"

      EventMachine::file_tail(path) do |filetail, line|
        puts "#{color_prefix} #{line}"
      end
    end
  end
end
