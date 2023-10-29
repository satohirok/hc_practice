# X = []
# 18.times do
# X << gets.to_i 
# end

# gets.chompを使うことで、getsで取得した文字列から改行文字を除去
# split(",") にて、文字列を ","を区切りにして配列を作成
# map(&:to_i)により、作成した配列をすべて数値に変換した配列を再度作成
X = gets.chomp.split(",").map(&:to_i)

# Y = []
# 18.times do
# Y << gets.to_i
# end
Y = gets.chomp.split(",").map(&:to_i)

result = []

score_mapping = {
  3 => {
    1 => "ホールインワン",
    2 => "バーディ",
    3 => "パー",
    4 => "ボギー"
  },
  4 => {
    1 => "ホールインワン",
    2 => "イーグル",
    3 => "バーディ",
    4 => "パー",
    5 => "ボギー"
  },
  5 => {
    1 => "コンドル",
    2 => "アルバトロス",
    3 => "イーグル",
    4 => "バーディ",
    5 => "パー",
    6 => "ボギー"
  }
}

result = X.map.with_index do |storoke, i|
  mapping = score_mapping[storoke]
  mapping[Y[i]] || "#{Y[i] - storoke}ボギー"
end

puts result.join(",")

# 0.upto(17) do |n|
#   if X[n] > 5 || X[n] < 3
#     raise ArgumentError , "#{n + 1} ホール目の値#{X[n]}は不正です。規定スコア(X)は3〜5に設定して下さい"
#     exit
#   elsif Y[n] < 1 
#     raise ArgumentError , "#{n + 1} 打目の値#{Y[n]}は不正です。打数(Y)の値は正の値に設定して下さい" 
#     exit
#   end
#   stroke = Y[n]
#   regulation = X[n]
#   result << Y[n] - X[n]
# end

# 0.upto(17) do |s|
# # 規定打数より多い場合
#   if result[s] == 1
#     print 'ボギー,'
#   elsif result[s] > 1
#     print " #{result[s]}ボギー,"
# # 規定打数以下の場合
#   elsif result[s] == 0
#     print 'パー,'
#   elsif result[s] == -1 && Y[s] > 1
#     print 'バーディー,'
#   elsif result[s] == -2 && Y[s] > 1
#     print 'イーグル,'
#   elsif result[s] == -3 && Y[s] > 1
#     print 'アルバトロス,'
#   elsif X[s] == 5 && Y[s] == 1 
#     print 'コンドル,'
#   elsif Y[s] == 1
#     print 'ホールインワン,'
#   end
# end