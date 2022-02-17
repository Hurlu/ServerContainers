from flask import Flask, render_template, request, session, send_from_directory
from sys import argv

app = Flask(__name__)

@app.route('/robots.txt')
def static_from_root():
    return send_from_directory(app.static_folder, request.path[1:])


@app.route("/")
def hello():
    return render_template('home.html')


if __name__ == "__main__":
    if len(argv) > 1:
        print("Teeeest")
        app.run(host='0.0.0.0', port=int(argv[1]))
    else:
        app.run(host='0.0.0.0', debug=True, port=9999)
