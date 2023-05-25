from flask_restx import Resource, Namespace
from http import HTTPStatus
import os

latex_namespace = Namespace("latex", description="Run LaTeX documents.")


@latex_namespace.route("/description")
class Description(Resource):
    def get(self):
        """Runs Description LaTeX file"""

        os.system("cd /latex/description && make all && make push")

        return {"message": "Description LaTeX file succesfully run."}, HTTPStatus.OK
