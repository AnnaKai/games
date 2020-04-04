def roll_dice (rolls, sides, threshold)
  max_sum = sides * rolls
  return 0 if max_sum < threshold

  hits = 0.0

  max_sum.downto(threshold).each do |sum|
    hits += count_hits(sides,rolls,sum)
  end

  hits / sides ** rolls
end


def count_hits(sides,rolls,threshold)
  table = []

  for i in 0..rolls
    table[i] = [0] * (threshold + 1)
  end

  for j in 1..([sides, threshold+1].min)
    table[1][j]=1
  end

  for i in 2..rolls
    for j in 1..threshold
      for k in 1..([sides,j].min)
        table[i][j] += table[i-1][j-k]
      end
    end
  end

  table[-1][-1]
end

