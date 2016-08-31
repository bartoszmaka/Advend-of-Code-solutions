require 'digest'
include Digest

class CoinsMiner

  attr_reader :number

  def initialize secret_key
    @key = secret_key
    @number = 0
    mine
  end

  private

  def mine
    loop do
      hash = Digest::MD5.hexdigest @key + @number.to_s
      hash.start_with?("000000") ? break : @number += 1
    end
  end
end

# puts "usage: ruby 4_1.rb input.txt"; abort if ARGV.empty?
Santa = CoinsMiner.new File.open(ARGV[0]).read.strip
puts Santa.number
