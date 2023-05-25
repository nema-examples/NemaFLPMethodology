import os

from api import create_app

api = create_app()

FLASK_RUN_PORT = os.environ.get("FLASK_RUN_PORT", 5000)

if __name__ == "__main__":
    api.run(port=FLASK_RUN_PORT)
