require 'pry'
# 整数の個数
N = gets.chomp.to_i
# 和の目標値
W = gets.chomp.to_i
# 整数のリスト
A = gets.chomp.split(' ').map(&:to_i)
# i個をまでの選択数を選んで重量wになるかどうかの真偽値を返す
MEMO = Hash.new { |h,k| h[k] = {} }
MEMO[0][0] = true

# i個個までの選択肢を総なめする
(0...N).each do |i|
  # 重さwが達成可能かを重量A[i]を使いつつ判定する
  (0..W).each do |j|
    next unless MEMO[i][j]

    if j + A[i] <= W
      MEMO[i + 1][j + A[i]] = true
    end

    MEMO[i + 1][j] = true
  end
end
print MEMO
puts MEMO[N][W] ? "YES" : "NO"
