from flask import *
import MySQLdb
app=Flask(__name__)
conn=MySQLdb.connect(host="localhost",user="root",passwd="root",port=3306,db="project")
cmd=conn.cursor()
app.secret_key="abc"
@app.route('/')
def main():
  return render_template("login.html")
@app.route('/login',methods=['get','post'])
def login():
    username=request.form['textfield']
    password=request.form['textfield2']
    cmd.execute("select * from login where user_name='"+username+"' and password='"+password+"'")
    s=cmd.fetchone()
    if s is None:
        return '''<script>alert("invalid username or password");window.location='/'</script>'''
    elif s[3]=='guestuser':
        return '''<script>alert("You Successfully Logged into Guestuser Home");window.location='/guesthome'</script>'''
    elif s[3] =='dmt':
        return '''<script>alert("You Successfully Logged into Disaster Management Team");window.location='/guesthome'</script>'''
    else:
        session['lid']=s[0]
        return '''<script>alert("You Successfully Logged into Local Authority Home");window.location='/localhome'</script>'''


@app.route('/userhome',methods=['get','post'])
def userhome():
  return render_template("hmepgof user.html")
@app.route('/localhome',methods=['get','post'])
def localhome():
  return render_template("hmepgoflocal.html")
@app.route('/guesthome',methods=['get','post'])
def guesthome():
  return render_template("hmepgofdmt.html")
@app.route('/meeting',methods=['get','post'])
def meeting():
    return render_template("meeting.html")
@app.route('/meeting1',methods=['get','post'])
def meeting1():
    subject=request.form['textarea']
    venue=request.form['textfield2']
    time=request.form['textfield3']
    agenda=request.form['textarea2']
    cmd.execute("insert into meeting values(null,'"+subject+"','"+venue+"','"+time+"','"+agenda+"')")
    conn.commit()
    return '''<script>alert("INSERTED");window.location="/meeting"</script>'''



@app.route('/legal',methods=['get','post'])
def legal():
    return render_template("legal warning.html")

@app.route('/legal1',methods=['get','post'])
def legal1():
    disaster=request.form['select']
    location=request.form['textfield']
    alert=request.form['select2']
    helpnum=request.form['textfield2']
    descri=request.form['textarea']
    precautions=request.form['textarea2']
    cmd.execute("insert into legal values(null,'"+disaster+"','"+location+"','"+alert+"','"+helpnum+"','"+descri+"','"+precautions+"')")
    conn.commit()
    return '''<script>alert("INSERTED");window.location="/legal"</script>'''

@app.route('/notification',methods=['get','post'])
def notification():
    cmd.execute("select * from notification")
    s = cmd.fetchall()
    return render_template("notificationview.html", val=s)


@app.route('/contact',methods=['get','post'])
def contact():
    id=session['lid']
    print(id)
    cmd.execute("select reg.*, login.user_name,login.password from reg join login on reg.reg_id=login.loginid where login.loginid='"+str(id)+"' ")

    s = cmd.fetchone()
    print(s)
    return render_template("contactinfo.html", val=s)
@app.route('/econtact',methods=['get','post'])
def econtact():
    id = session['lid']
    localname = request.form['textfield']
    place = request.form['textfield2']
    post = request.form['textfield3']
    pin = request.form['textfield4']
    city = request.form['textfield5']
    emailid = request.form['textfield6']
    phone = request.form['textfield7']
    user_name = request.form['textfield8']
    password = request.form['textfield9']
    cmd.execute("update  reg set localname='" + localname + "',place='" + place + "',post='" + post + "',pin='" + pin + "',city='" + city + "',emailid='" + emailid + "',phone='" + phone + "' where reg_id='"+str(id)+"'")
    cmd.execute("update login set user_name='"+user_name+"',password='"+password+"' where loginid='"+str(id)+"'")
    conn.commit()
    return '''<script>alert("INSERTED");window.location="reg"</script>'''

    conn.commit()
    return redirect('/localhome')



@app.route('/viewmeet',methods=['get','post'])
def viewmeet():
    cmd.execute("select * from meeting")
    s = cmd.fetchall()
    return render_template("meetingview.html",val=s)
@app.route('/addlocal',methods=['get','post'])
def addlocal():
    return render_template("regist.html")
@app.route('/addlocal1',methods=['get','post'])
def addlocal1():
    name=request.form['textfield']
    house_name=request.form['textfield3']
    street=request.form['textfield4']
    post=request.form['textfield5']
    city=request.form['textfield6']
    district=request.form['textfield7']
    phone=request.form['textfield2']
    cmd.execute("insert into contact values(null,'"+name+"','"+house_name+"','"+street+"','"+post+"','"+city+"','"+district+"','"+phone+"')")
    conn.commit()
    return '''<script>alert("INSERTED");window.location="/addlocal"</script>'''
@app.route('/addnoti',methods=['get','post'])
def addnoti():
    return render_template("notifications.html")

@app.route('/addnoti1', methods=['get', 'post'])
def addnoti1():

    disaster=request.form['select']
    description=request.form['textarea']
    date=request.form['textfield2']
    time=request.form['textfield3']
    cmd.execute("insert into notification values(null,'"+disaster+"','"+description+"','"+date+"','"+time+"')")
    conn.commit()
    return '''<script>alert("INSERTED");window.location="/addnoti"</script>'''
@app.route('/addreport', methods=['get','post'])
def addreport():
    return render_template("report.html")
@app.route('/addreport1', methods=['get','post'])
def addreport1():
    disaster=request.form['select']
    location=request.form['textfield']
    landmark=request.form['textfield2']
    description=request.form['textarea']
    alertlevel=request.form['textfield3']
    precautions=request.form['textarea2']
    cmd.execute("insert into report values(null,'"+disaster+"','"+location+"','"+landmark+"','"+description+"','"+alertlevel+"','"+precautions+"')")
    conn.commit()
    return '''<script>alert("INSERTED");window.location="addreport"</script>'''
@app.route('/reportview', methods=['get','post'])
def reportview():
    cmd.execute("select * from report")
    s = cmd.fetchall()
    return render_template("reportview.html", val=s)
@app.route('/reg', methods=['get','post'])
def reg():
    return render_template("regist.html")

@app.route('/reg1', methods=['get','post'])
def reg1():

    localname=request.form['textfield']
    place=request.form['textfield2']
    post=request.form['textfield3']
    pin=request.form['textfield4']
    city=request.form['textfield5']
    emailid=request.form['textfield6']
    phone=request.form['textfield7']
    user_name=request.form['textfield8']
    password=request.form['textfield9']
    cmd.execute("insert into login values(null,'"+user_name+"','"+password+"','local')")
    id=conn.insert_id()
    cmd.execute("insert into reg values('"+str(id)+"','"+localname+"','"+place+"','"+post+"','"+pin+"','"+city+"','"+emailid+"','"+phone+"')")
    conn.commit()
    return '''<script>alert("INSERTED");window.location="reg"</script>'''
@app.route('/suggview', methods=['get','post'])
def suggview():
    cmd.execute("select suggestion.*,userlogin.name,userlogin.location from suggestion join userlogin on suggestion.user_id=userlogin.user_id")
    s = cmd.fetchall()
    print(s)
    return render_template("suggestionview.html",val=s)

@app.route('/userreport', methods=['get','post'])
def userreport():
    cmd.execute("select userreport.*,userlogin.name,userlogin.location from userreport join userlogin on userreport.user_id=userlogin.user_id")
    s = cmd.fetchall()
    return render_template("userreportview.html",val=s)

if __name__=="__main__":
    app.run(debug=True)



