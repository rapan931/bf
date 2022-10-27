# "+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-.------------.<++++++++.--------.+++.------.--------.>+."
require "minitest/autorun"
require_relative "bf"

describe "Bf" do
  before do
    @bf = Bf.new
  end

  describe "outputs 'Hello World!'" do
    it "must respond positively" do
      assert_output("Hello, world!\n") do
        @bf.exec("+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-.------------.<++++++++.--------.+++.------.--------.>+.")
      end
    end
  end
end
