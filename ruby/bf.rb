class Bf
  def set(src)
    @pc = 0 # pointer
    @dc = 0 # value
    @src = src # code
    @mem = Array.new(30000, 0) # memory
  end

  def exec
    step while @pc != @src.length
    puts
  end

  private

  def step
    op = @src[@pc]
    case op
    when ">" then @dc += 1
    when "<" then @dc -= 1
    when "+" then @mem[@dc] += 1
    when "-" then @mem[@dc] -= 1
    when "." then print @mem[@dc].chr
    when "[" then jump_loop_end if @mem[@dc].zero?
    when "]" then jump_loop_start if @mem[@dc].nonzero?
    end

    @pc += 1
  end

  def jump_loop_end
    depth = 0
    @pc += 1
    while depth.positive? || @src[@pc] != "]"
      case @src[@pc]
      when "[" then depth += 1
      when "]" then depth -= 1
      end

      @pc += 1
    end

    @pc += 1
  end

  def jump_loop_start
    depth = 0
    @pc -= 1
    while depth.positive? || @src[@pc] != "["
      case @src[@pc]
      when "]" then depth += 1
      when "[" then depth -= 1
      end

      @pc -= 1
    end
  end

end
# bf = Bf.new
# bf.set(ARGV[0])
# bf.exec
