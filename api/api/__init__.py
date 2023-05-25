from flask import Flask
from flask_restx import Api

from .latex.views import latex_namespace


def create_app():
    app = Flask(__name__)

    authorizations = {
        "Bearer Auth": {
            "type": "apiKey",
            "in": "header",
            "name": "Authorization",
            "description": "Add a JWT with ** Bearer &lt;JWT&gt; to authorize",
        }
    }

    api = Api(
        app,
        title="Nema API",
        description="A REST API for the Nema information system",
        authorizations=authorizations,
        security="Bearer Auth",
        version="0.1",
    )

    api.add_namespace(latex_namespace, path="/latex")

    return app
