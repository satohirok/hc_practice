members = ['A','B','C','D','E','F']


random_num1 = [2,3,4].sample


group1 = members.sample(random_num1).sort
group2 = members - group1

p group1.sort
p group2.sort


