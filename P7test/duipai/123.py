name = input("输入文件名")
name_new = 'new_' + name
with open(name, 'r', encoding = 'utf-8') as f1:
    tot = f1.readlines()
# print(tot[0])
with open(name_new, 'w', encoding = 'utf-8') as f2:
    for line in tot:
        # print(line)
        i = line.index('@')
        # print(i)
        f2.write(line[i:])