from bottle import Bottle, static_file, template, run, HTTPResponse
from datetime import datetime
from dateutil.relativedelta import relativedelta
import json

app = Bottle()

start_time = datetime(2022, 8, 23, 18, 16)

# 🎉 Datas especiais (MM-DD)
SPECIAL_DAYS = {
    "08-23": {
        "extra_message": "Hoje é nosso aniversário ❤️ Obrigado por tudo!",
        "confetti": True
    },
    "02-14": {
        "extra_message": "Happy Valentine's 💘",
        "confetti": True
    },
    "06-12": {
        "extra_message": "Feliz Dia dos Namorados 💘",
        "confetti": True
    },
    "12-25": {
        "extra_message": "Nosso amor é o melhor presente 🎄",
        "confetti": False
    },
    "01-27": {
        "extra_message": "Quero ver muitos mais dos seus anos ❤️",
        "confetti": True
    }
}

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

    base_message = (
        f"Eu tenho a melhor namorada do mundo há "
        f"{elapsed['years']} anos, {elapsed['months']} meses, "
        f"{elapsed['weeks']} semanas, {elapsed['days']} dias, "
        f"{elapsed['hours']} horas, {elapsed['minutes']} minutos "
        f"e {elapsed['seconds']} segundos."
    )

    today_key = now.strftime("%m-%d")
    special = SPECIAL_DAYS.get(today_key, {})

    response = {
        "message": base_message,
        "extra_message": special.get("extra_message"),
        "confetti": special.get("confetti", False)
    }

    return HTTPResponse(
        status=200,
        body=json.dumps(response, ensure_ascii=False),
        content_type='application/json'
    )

@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='static')

# Only for local testing
if __name__ == '__main__':
    run(app, host='localhost', port=8080, debug=True)
