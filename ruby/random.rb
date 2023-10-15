members = ['A','B','C','D','E','F'].shuffle!


p '3人と3人にランダムに分ける'
p members[0..2].sort!
p members[3..5].sort!

p '2人と4人にランダムに分ける'
p members[0..1].sort!
p members[2..5].sort!
