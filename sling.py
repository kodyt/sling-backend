from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/next_screen', methods=['GET'])
def next_screen():
    # Logic to determine next screen
    # This could be based on user data, time of day, etc.
    return jsonify({"screen": "Details"})

if __name__ == '__main__':
    app.run(debug=True)
