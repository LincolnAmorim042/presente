from bottle import Bottle, static_file, template, run, HTTPResponse
from datetime import datetime
from dateutil.relativedelta import relativedelta
import json

app = Bottle()

start_time = datetime(2022, 8, 23, 18, 16)

@app.route('/')
def home():
    return template('index')

@app.route('/code')
def code_page():
    return template('code')

@app.route('/teamo')
def te_amo():
    return template('teamo')

@app.route('/time')
def time_api():
    now = datetime.now()
    delta = relativedelta(now, start_time)

    elapsed = {
        "years": delta.years,
        "months": delta.months,
        "weeks": delta.days // 7,
        "days": delta.days % 7,
        "hours": delta.hours,
        "minutes": delta.minutes,
        "seconds": delta.seconds
    }

    message = f"Eu tenho a melhor namorada do mundo há {elapsed['years']} anos, {elapsed['months']} meses, {elapsed['weeks']} semanas, {elapsed['days']} dias, {elapsed['hours']} horas, {elapsed['minutes']} minutos e {elapsed['seconds']} segundos."

    return HTTPResponse(status=200, body=json.dumps({"message": message}), content_type='application/json')

@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='static')

# Only for local testing
if __name__ == '__main__':
    run(app, host='localhost', port=8080, debug=True)
