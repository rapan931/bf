class Bf
  def exec(src)
    set(src)
    step while @pc != @src.length
  end

  private

  def set(src)
    @pc = 0 # pointer
    @dc = 0 # value
    @src = src # code
    @mem = Array.new(30000, 0) # memory
  end

  def step
    op = @src[@pc]

    case op
    when ">" then @dc += 1
    when "<" then @dc -= 1
    when "+" then @mem[@dc] += 1
    when "-" then @mem[@dc] -= 1
    when "." then print @mem[@dc].chr

    when "[" then jump_loop_end
    when "]" then jump_loop_start

    end

    @pc += 1
  end

  def jump_loop_end
    return if @mem[@dc].nonzero?

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
    return if @mem[@dc].zero?

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
# bf.exec(ARGV[0])
