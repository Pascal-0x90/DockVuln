from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/')


def index():
    return f'''
    <h1><center>Welcome to the training grounds.</center></h1>
    <h3><center>The source code for the target machine can be found <a href="/code">here</a></center></h3>
    <h3><center>The attack page containing the source code can be found <a href="/attack">here</a></center></h3>
    '''

f = open("code.txt","r")
source_code = f.read()

@app.route('/code')
def code():
    return source_code.replace('<?php','')


@app.route('/attack')
def attack():
    return render_template('exploit.html')

if __name__ == '__main__':
    app.run(host="localhost", port=80)
