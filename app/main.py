# from flask import Flask, jsonify
# from flask_sqlalchemy import SQLAlchemy

# app = Flask(__name__)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://username:password@localhost/healthApp'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# db = SQLAlchemy(app)

from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
import sqlite3
from sqlite3 import Error
from flask_cors import CORS

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///healthApp.db'  # Use triple slashes for relative path
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
CORS(app) 


class UserSymptoms(db.Model):
    __tablename__ = 'UserSymptoms'
    UserSymptomID = db.Column(db.Integer, primary_key=True)
    UserID = db.Column(db.Integer)
    SymptomID = db.Column(db.Integer, db.ForeignKey('Symptoms.SymptomID'))
    StartTime = db.Column(db.DateTime)
    EndTime = db.Column(db.DateTime)
    Notes = db.Column(db.String(255))

class Symptoms(db.Model):
    __tablename__ = 'Symptoms'
    SymptomID = db.Column(db.Integer, primary_key=True)
    SymptomName = db.Column(db.String(255))
    Descriptions = db.Column(db.String(255))

@app.route('/user/<int:user_id>/symptoms', methods=['GET'])
def get_user_symptoms(user_id):
    symptoms = db.session.query(UserSymptoms, Symptoms).join(Symptoms, UserSymptoms.SymptomID == Symptoms.SymptomID).filter(UserSymptoms.UserID == user_id).all()
    results = [
        {"SymptomName": symptom.Symptoms.SymptomName, "Descriptions": symptom.Symptoms.Descriptions, "StartTime": symptom.UserSymptoms.StartTime, "EndTime": symptom.UserSymptoms.EndTime, "Notes": symptom.UserSymptoms.Notes}
        for symptom in symptoms
    ]
    return jsonify(results)

# TODO: Work on the data visualization
# based on the seed data we should be able to build graphs or at least return data?

def create_connection(db_file):
    """ create a database connection to the SQLite database specified by db_file """
    conn = None
    try:
        conn = sqlite3.connect(db_file)
        return conn
    except Error as e:
        print(e)

    return conn

def input_pain():

    database = "sqlite:///healthApp.db"

    # create a database connection
    conn = create_connection(database)
    with conn:
        # Insert sql statement
        user_id = 1 
        # TODO: Need to get the usersymptomId first before inserting
        # In theory we should have severity, type of pain, startime, endtime
        sql = f''' INSERT INTO PainLog (UserSymptomID, Severity, MovedLocation, TypeOfPain, StartTime, EndTime) VALUES ({user_id},'''
        cur = conn.cursor()
        cur.execute(sql, project)
        conn.commit()
        return cur.lastrowid

        print(f"Project created with id: {project_id}")

# Testing for the connection between two servers
# @app.route('/print-message', methods=['GET'])
# def print_message():
#     print("Something was printed to the terminal")
#     return "Message printed to terminal", 200


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
