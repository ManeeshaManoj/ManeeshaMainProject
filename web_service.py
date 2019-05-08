import os
from flask import *
import MySQLdb
from werkzeug.utils import secure_filename

app=Flask(__name__)
conn=MySQLdb.connect(host="localhost",user="root",passwd="root",port=3306,db="project")
cmd=conn.cursor()

path="C:\\Users\\user\\PycharmProjects\\natural disaster prediction\\project\\static\\reportimg"
@app.route('/log',methods=['POST','GET'])
def log():
    username = request.args.get('username')
    print(username)
    password= request.args.get('password')
    print(password)
    cmd.execute("select * from login where user_name='"+username+"' and password='"+password+"'" )
    s = cmd.fetchone()
    print(s)
    if s[3]=='guestuser':
        return jsonify({'task': s[0]})

    else:
        return jsonify({'task': 'error'})

@app.route('/register',methods=['POST','GET'])
def register():
    name=request.args.get('name')
    location = request.args.get('location')
    phone = request.args.get('phone')

    try:
        cmd.execute("insert into login values (null,'"+name+"','"+phone+"','guestuser')")
        tid = conn.insert_id()
        cmd.execute("insert into userlogin values('"+str(tid)+"','" + name + "','" + location + "','"+phone+"')")
        print(tid)
        conn.commit()
        return jsonify({'task': "success"})
    except Exception as e:
        print(e)
        return jsonify({'task': "error"})

@app.route('/view_legal',methods=['POST','GET'])
def view_legal():
    cmd.execute("select * from legal")
    row_headers = [x[0] for x in cmd.description]
    res = cmd.fetchall()
    json_data = []
    for result in res:
       json_data.append(dict(zip(row_headers, result)))
    print(json_data)
    return jsonify(json_data)
@app.route('/reports',methods=['POST','GET'])
def reports():
    user_id=request.form['user_id']
    report= request.form['report']
    c_image=request.files['files']
    fname=secure_filename(c_image.filename)
    c_image.save(os.path.join(path,fname))
    cmd.execute("insert into reportuser values(null,'"+user_id+"',curdate(),'"+report+"','"+fname +"')")
    conn.commit()
    return jsonify({'task': "success"})


@app.route('/suggestions', methods=['POST', 'GET'])
def suggestions():
    user_id=request.args.get('user_id')
    sugg = request.args.get('sugg')
    cmd.execute("insert into suggestion values(null,'"+user_id+"',curdate(),'" + sugg+"')")

    conn.commit()
    return jsonify({'task': "success"})



if __name__=="__main__":
    app.run(host='192.168.43.182',port=5000)