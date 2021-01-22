import os, sys, random


file = random.choice(os.listdir("/home/mkeeley/Documents/PHPfiles/files"))


def make_index():
    code = '''
<html>
<h1><center>Welcome to the training grounds.</center></h1>
<h3><center>The source code for the target machine can be found <a href="/code">here</a></center></h3>
<h3><center>The attack page containing the source code can be found <a href="/attack">here</a></center></h3>
</html>
    '''
    f = open('index.php', "w")
    f.write(code)
    f.close()


def make_code():
    temp_file = file
    temp_file.replace("<?php","")
    temp_file.replace("?>","")
    f = open('code', "w")
    f.write(temp_file)
    f.close()

def make_attack():
    temp_file = file
    f = open('attack.php', "w")
    f.write(temp_file)
    f.close()

make_index()
make_code()
make_attack()