X = []
18.times do
X << gets.to_i 
end

Y = []
18.times do
Y << gets.to_i
end

result = []

0.upto(17) do |n|
  if X[n] > 5 || X[n] < 3
    puts "#{n + 1} ホール目の値#{X[n]}は不正です"
    puts '規定スコア(X)は3〜5に設定して下さい'
    exit
  elsif Y[n] < 1 
    puts "#{n + 1} 打目の値#{Y[n]}は不正です" 
    puts '打数(Y)の値は正の値に設定して下さい'
    exit
  end
  stroke = Y[n]
  regulation = X[n]
  result << Y[n] - X[n]
end

0.upto(17) do |s|
# 規定打数より多い場合
  if result[s] == 1
    print 'ボギー,'
  elsif result[s] > 1
    print " #{result[s]}ボギー,"
# 規定打数以下の場合
  elsif result[s] == 0
    print 'パー,'
  elsif result[s] == -1 && Y[s] > 1
    print 'バーディー,'
  elsif result[s] == -2 && Y[s] > 1
    print 'イーグル,'
  elsif result[s] == -3 && Y[s] > 1
    print 'アルバトロス,'
  elsif X[s] == 5 && Y[s] == 1 
    print 'コンドル,'
  elsif Y[s] == 1
    print 'ホールインワン,'
  end
end