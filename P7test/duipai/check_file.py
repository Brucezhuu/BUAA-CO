import os

err_rec = []
test_times = int(input("请输入test_log_file文件夹中log序号最大值："))
for i in range(1, test_times + 1):
    if (os.path.exists("test_log_file\\log_{}".format(i)) == False):
        continue
    print("\n测试进度:  {}/{}".format(i, test_times))
    lines_1 = []
    for line in open("test_log_file\\log_{}\\out_1.txt".format(i)):
        if (line[0] != "@" or line[0] == ""):
            break
        else:
            lines_1.append(line)
    lines_2 = []
    for line in open("test_log_file\log_{}\out_2.txt".format(i)):
        if (line[0] != "@" or line[0] == ""):
            break
        else:
            lines_2.append(line)
    if (len(lines_1) != len(lines_2)):
        print("test{} error!".format(i))
        err_rec.append("{}".format(i))
    else:
        lines_len = len(lines_1)
        flag = 0
        for j in range(0, lines_len):
            if (lines_1[j] != lines_2[j]):
                print("test{} error!".format(i))
                err_rec.append("{}".format(i))
                flag = 1
                break
        if (flag == 0):
            print("test{} success!".format(i))
if (len(err_rec) == 0):
    print("All correct")
else:
    print("The wrong tests are")
    print(err_rec)