# "+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-.------------.<++++++++.--------.+++.------.--------.>+."
require "minitest/autorun"
require_relative "bf"

describe "Bf" do
  it "outputs 'Hello World!'" do
    assert_output("Hello, world!") do
      bf = Bf.new
      bf.exec("+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-.------------.<++++++++.--------.+++.------.--------.>+.")
    end
  end
end
