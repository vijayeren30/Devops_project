from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "hi this is my devops automated pipeline site..."

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)