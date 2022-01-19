import os
import re
import shutil

MODE1 = 1
MODE2 = 2

run_time = "50us" #设定仿真时间
xilinx_path = "D:\\COverilog\\Xilinx\\14.7\\ISE_DS\\ISE" #ISE路径
p1_path = "D:\\p7\\p7_L0" #工程文件夹路径
p2_path = "D:\\p7\\wzy" #工程文件夹路径
#p2_path = "D:\\p7\\mips_ccy"
out1_path = ".\\out_1.txt" #verilog输出文件路径
out2_path = ".\\out_2.txt" #verilog输出文件路径
mips_code_path = ".\\mips_code.asm" #mips代码文件路径
source_tb_path = ".\\mips_tb_my.v" #源tb文件路径， 程序会将该路径下的tb文件复制到工程文件夹下， 重新命名为命名为test_bench_name
target_tb_name = "mips_txt" #工程文件夹下的tb的命名

error = []
passed = int(0)

def run_mars():
    print("编译并运行MIPS文件……")
    os.system("java -jar Mars.jar nc a db mc CompactDataAtZero dump 0x00003000-0x0000417c HexText text.txt " + mips_code_path)
    os.system("java -jar Mars.jar nc a db mc CompactDataAtZero dump 0x00004180-0x00004f00 HexText ktext.txt " + mips_code_path)
    with open(r"text.txt","r") as textfile:
        with open(r"ktext.txt","r") as ktextfile:
            with open(r"code.txt","w") as codefile:
                for i in range(0x3000,0x4180,4) :
                    ret1 =textfile.readline()
                    if(ret1):
                        codefile.write(ret1)
                    else:
                        codefile.write("00000000\n")
                codefile.write(ktextfile.read())
    os.remove("text.txt")
    os.remove("ktext.txt")

def copy_file(source_path, target_path):
    f_1 = open(source_path, "r", encoding="utf-8")
    list_temp = f_1.readlines()
    f_2 = open(target_path, "w", encoding="utf-8")
    f_2.writelines(list_temp)
    f_1.close()
    f_2.close()

def load_hex_code(p_path):
    list_temp = []
    with open("code.txt", "r+") as hex_code:
        list_temp = hex_code.readlines()
        f = open(p_path + ".\\code.txt", "w")
        f.writelines(list_temp)

def load_tb(p_path):
    copy_file(source_tb_path, p_path + "\\mips_tb.v")


def run_ise(p_path, out_path, i):
    print("编译并运行Verilog文件{}……".format(i))
    file_list = []
    for i, j ,k in os.walk(p_path):
        for file in k:
            if file.endswith(".v"):
                file_list.append(file)

    with open(p_path + "\\mips.prj", "w") as prj:
        for i in range(len(file_list)):
            prj.write("Verilog work \"" + p_path + "\\" + file_list[i] + "\"\n")       

    with open(p_path + "\\mips.tcl", "w") as tcl:
        tcl.write("run " + run_time +";\nexit")
    
    os.environ["XILINX"] = xilinx_path
    os.system(xilinx_path + "\\bin\\nt64\\fuse -nodebug -prj " + p_path + "\\mips.prj -o mips.exe " + target_tb_name + " > compile_log.txt")
    os.system("mips.exe -nolog -tclbatch " + p_path + "\\mips.tcl> " + out_path)
    # del unuseful files
    shutil.rmtree(".\\isim")
    os.remove("compile_log.txt")
    os.remove("fuse.log")
    os.remove("fuse.xmsgs")
    os.remove("fuseRelaunch.cmd")
    os.remove("isim.wdb")
    os.remove("mips.exe")


        
def file_cmp(order, mode):
    global passed
    time = int()
    with open(out1_path, "r") as f:
        out_1 = f.readlines()
        while not ('@' in out_1[0]):
            out_1.pop(0)

    with open(out2_path, "r") as f:
        out_2 = f.readlines()
        while not ('@' in out_2[0]):
            out_2.pop(0)

    flag = 0
    with open(".\\log.txt", "w") as log:
        if(len(out_1) > len(out_2)):
            log.write("The number of lines are different!!!")
            flag = 1
        for i in range(min(len(out_1), len(out_2))):
            if(mode == MODE1):
                out_1[i] = out_1[i].strip() + '\n'
                out_2[i] = out_2[i].strip() + '\n'
            if(mode == MODE2):
                out_1[i] = out_1[i][out_1[i].index('@'):].strip() + '\n'
                out_2[i] = out_2[i][out_2[i].index('@'):].strip() + '\n'
            if(out_1[i] != out_2[i]):
                flag = 1
                log.write("Different in line {}\n".format(i))
                log.write("output of file_1 is \"{}\"\noutput of file_2 is \"{}\"\n\n".format(out_1[i][:-1], out_2[i][:-1]))
        
    with open(out1_path, "w") as f:
        f.writelines(out_1)
    with open(out2_path, "w") as f:
        f.writelines(out_2)
        
    if(flag):
        print("测试结果:  Different!")
        error.append(order)
        os.makedirs(".\\test_log_file\\log_{}\\".format(order))
        copy_file("log.txt", ".\\test_log_file\\log_{}\\log.txt".format(order))
        copy_file("code.txt", ".\\test_log_file\\log_{}\\code.txt".format(order))
        copy_file(mips_code_path, ".\\test_log_file\\log_{}\\mips_code.asm".format(order))
        copy_file(out1_path, ".\\test_log_file\\log_{}\\out_1.txt".format(order))
        copy_file(out2_path, ".\\test_log_file\\log_{}\\out_2.txt".format(order))
    else:
        print("测试结果:  Same!")
        passed = passed + 1



test_times = int(input("请输入测试次数："))
print("测试开始！\n")

if os.path.exists(".\\test_log_file"):
    shutil.rmtree(".\\test_log_file") 
os.makedirs(".\\test_log_file\\")
print("错误日志文件夹已创建！")


for i in range(1, test_times+1):

    print("\n测试进度:  {}/{}".format(i, test_times))
    #mips_code_path = "E:\\BUAA\\CO_Project\\cyw\\testpoint{}.asm".format(i)
    mips_code_path = "D:\\p7\\CH_test\\other_normal\\testpoint{}.asm".format(i)
    #mips_code_path = r"D:\本科资料\大二上\计算机组成\实验\P7\测试数据\test\wzm\testdata{}\testdata{}.asm".format(i-1, i-1)
    # test_bench_path = r"D:\本科资料\大二上\计算机组成\实验\P7\测试数据\test\wzm\testdata{}\tb".format(i-1)
    run_mars()
    load_tb(p1_path)
    load_tb(p2_path)
    load_hex_code(p1_path)
    load_hex_code(p2_path)
    run_ise(p1_path, out1_path, 1)
    run_ise(p2_path, out2_path, 2)
    file_cmp(i, MODE2)

print("\n通过率：{}/{}".format(passed,test_times))
if(len(error) != 0):
    print("错误样例:", error)

    

