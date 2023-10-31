# A、B、C、D、E、Fという6人のグループがありました。
members = ['A','B','C','D','E','F']

# 上記グループを3人と3人、または2人と4人にランダムに分けるプログラム

# 2 or 3の数字を無作為に1つ選ぶ(sample)
random_num = [2,3].sample

# membersの中から、2人 or 3人を無作為(randam_num)に選び,配列で返す
group1 = members.sample(random_num)
# 上記で選ばれたメンバー(group1)を全体(members)から引くことで残りのメンバーの部屋(配列)を作る
group2 = members - group1

# 各部屋のメンバーをアルファベット順(sort)に並べて出力する。
p group1.sort
p group2.sort