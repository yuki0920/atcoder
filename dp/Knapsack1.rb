N, W = gets.chomp.split.map(&:to_i)
wv = Array.new(N).map { gets.chomp.split.map(&:to_i) }

dp = Array.new(N + 1) { Array.new(W + 1) { 0 }}
# dp[i][j] i個目までの品物を選び、重さjであるときの価値の最大値
# 0 <= i <= N - 1, 0 <= j <= W
# dp[i + 1][j] = dp[i][j - weight] + value
# ddp[i + 1][j] = dp[i][j]
# output dp[N]の最大値

N.times do |i|
  (0..W).each do |j|
    weight, value = wv[i]
    if j >= weight
      dp[i + 1][j] = [dp[i][j], dp[i][j - weight] + value].max
    else
      dp[i + 1][j] = dp[i][j]
    end
  end
end

puts dp[N][W]
