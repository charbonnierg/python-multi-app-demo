from starlette.applications import Starlette
from starlette.routing import Mount

from app1.server import app as app1
from app2.server import app as app2


app = Starlette()

app.router.routes.extend(
    Mount("/app1", app1, name="app1"),
    Mount("/app2", app2, name="app2"),
)
