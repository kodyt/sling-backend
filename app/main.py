# from flask import Flask, jsonify
# from flask_sqlalchemy import SQLAlchemy

# app = Flask(__name__)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://username:password@localhost/healthApp'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# db = SQLAlchemy(app)

from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///healthApp.db'  # Use triple slashes for relative path
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


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

if __name__ == '__main__':
    app.run(debug=True)
