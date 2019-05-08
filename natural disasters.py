from flask import *
import MySQLdb
from project.svm1 import *
# from project.algorithm import predict

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
    return '''<script>alert("INSERTED");window.location="/localhome"</script>'''



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
    return '''<script>alert("INSERTED");window.location="/localhome"</script>'''

@app.route('/notification',methods=['get','post'])
def notification():
    cmd.execute("select * from notification  where status='pending'")
    s = cmd.fetchall()
    return render_template("notificationview.html", val=s)
@app.route('/viewnoti',methods=['get','post'])
def viewnoti():
    id=request.args.get('id')
    cmd.execute("update notification set status='viewed' where notification_id='"+id+"' ")
    conn.commit()
    return redirect("notification")


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
    return '''<script>alert("INSERTED");window.location="localhome"</script>'''

    conn.commit()
    return redirect('/localhome')



@app.route('/viewmeet',methods=['get','post'])
def viewmeet():
    cmd.execute("select * from meeting")
    s = cmd.fetchall()
    return render_template("meetingview.html",val=s)
@app.route('/viewmore')
def viewmore():
    id=request.args.get('id')
    cmd.execute("select * from meeting where meet_id='"+str(id)+"'")
    s = cmd.fetchone()
    print(s)
    return render_template("meetview1.html",val=s)

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
    return '''<script>alert("INSERTED");window.location="/guesthome"</script>'''
@app.route('/addnoti',methods=['get','post'])
def addnoti():
    return render_template("notifications.html")

@app.route('/addnoti1', methods=['get', 'post'])
def addnoti1():


    disaster=request.form['select']
    description=request.form['textarea']
    date=request.form['textfield2']
    time=request.form['textfield3']
    cmd.execute("insert into notification values(null,'"+disaster+"','"+description+"','"+date+"','"+time+"','pending')")
    conn.commit()
    return '''<script>alert("INSERTED");window.location="/guesthome"</script>'''
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
    return '''<script>alert("INSERTED");window.location="guesthome"</script>'''
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
    return '''<script>alert("INSERTED");window.location="guestuser"</script>'''
@app.route('/suggview', methods=['get','post'])
def suggview():
    cmd.execute("select suggestion.*,userlogin.name,userlogin.location from suggestion join userlogin on suggestion.user_id=userlogin.user_id")
    s = cmd.fetchall()
    print(s)
    return render_template("suggestionview1.html",val=s)
@app.route('/suggviewmore')
def suggviewmore():
    id=request.args.get('id')
    print(id)
    cmd.execute("select userlogin.name,location,suggestion.date,sugg from userlogin join suggestion on suggestion.user_id=userlogin.user_id where suggestion.user_id='"+str(id)+"'")
    s = cmd.fetchone()
    print(s)
    return render_template("suggviewmore.html",d=s)


@app.route('/userreport', methods=['get','post'])
def userreport():
    cmd.execute("select reportuser.*,userlogin.name,userlogin.location from reportuser join userlogin on reportuser.user_id=userlogin.user_id")
    s = cmd.fetchall()
    return render_template("userreportview.html",val=s)
@app.route('/features1',methods=['get','post'])
def features1():
    return render_template("features.html")
@app.route('/features',methods=['get','post'])
def features():
    place=request.form['textfield']
    l_type= request.form['textfield2']
    triger= request.form['textfield3']
    l_size = request.form['textfield4']
    dis_river= request.form['textfield5']
    elevation = request.form['textfield6']
    aspect= request.form['textfield7']
    soil_Type=request.form['textfield8']
    latitude= request.form['textfield9']
    longitude= request.form['textfield10']

    cmd.execute("insert into inputdatas values (null,'"+place+"','"+l_type+"','"+triger+"','"+l_size+"','"+dis_river+"','"+elevation+"','"+aspect+"','"+soil_Type+"','"+latitude+"','"+longitude+"','9')")
    conn.commit()
    return '''<script>alert("INSERTED");window.location="/guesthome"</script>'''
# @app.route('/location',methods=['get','post'])
# def location():
#     return render_template("place.html")
@app.route('/search_place1',methods=['GET','POST'])
def search_place1():
    return render_template("place.html")

@app.route('/search_place',methods=['GET','POST'])
def search_place():
    place=request.form['textfield']
    cmd.execute("select l_type,triger,l_size,dis_river,elevation,aspect,soil_type,latitude,longitude from inputdatas where place='"+place+"' order by id desc")
    s=cmd.fetchone()

    cmd.execute(
        "select id from inputdatas where place='" + place + "' order by id desc")
    s1 = cmd.fetchone()
    ar=list()
    for res in s:
        ar.append(res)
    print("ar",ar)
    sum=0.0

    for sss in ar:
        sum=sum+sss
    avg=sum/len(ar)

    print(avg)

    result = svm_classifier(ar)
    res=""
    print("res-------",str(result[0]))
    alert='yellow'

    if avg>350:
        alert="or"
    if avg>400:
        alert="red"


    if (result[0] == 0):
        res="Safe Spot"
        print("Safe Spot")

    elif (result[0] == 1):
        cmd.execute("insert into report_prediction values("+str(s1[0])+",'Possibility for Landslide','','"+alert+"')")
        conn.commit()
        res="Possibility for Landslide "
        print("Possibility for Landslide ")
        # return redirect('/guesthome')
    elif (result[0] == 2):
        cmd.execute( "insert into report_prediction values(" + str(s1[0]) + ",'Possibility for Flood','','" + alert + "')")
        conn.commit()
        res="Possibility for Flood"
        print("Possibility for Flood")
        # return render_template()
    elif (result[0] ==3):
        cmd.execute(
            "insert into report_prediction values(" + str(s1[0]) + ",'Possibility for Drought','','" + alert + "')")
        conn.commit()
        res="Possibility for Drought"
        print("Possibility for Drought")
        # return render_template("")
    elif (result[0] ==4):
        cmd.execute(
            "insert into report_prediction values(" + str(s1[0]) + ",'Possibility for Storm','','" + alert + "')")
        conn.commit()
        res="Possibility for Storm"
        print("Possibility for Storm")


    else:
        res="Safe spot"
        print("Safe spot")
    return render_template("map.html",result=res,pls=place)

@app.route('/precaution',methods=['GET','POST'])
def precaution():
    return render_template("precaut1.html")


@app.route('/precautions',methods=['GET','POST'])
def precautions():
    Type_of_dis=request.form['select']
    Precautions=request.form['textarea']
    cmd.execute("insert into precautions values (null,'"+Type_of_dis+"','"+Precautions+"')")
    conn.commit()
    return '''<script>alert("Precautions added");window.location='/guesthome'</script>'''

@app.route('/viewprecaution', methods=['get','post'])
def viewprecaution():
    return render_template("viewprecaution.html")
@app.route('/viewprecautions', methods=['get','post'])
def viewprecautions():
    type=request.form['select']
    cmd.execute("select * from precautions where type_of_dis='"+type+"'")
    s=cmd.fetchall()
    return render_template("viewprecaution.html",val=s)

# @app.route('/viewprecautions', methods=['get','post'])
# def viewprecautions():



if __name__=="__main__":
    app.run(debug=True)



