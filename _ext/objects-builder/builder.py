from sphinx.application import Sphinx
from sphinx.util.inventory import InventoryFile

from docutils import nodes
from sphinx.builders import Builder

class ObjectsBuilder(Builder):
    name = "objects"

    allow_parallel = True

    def init(self) -> None:
        self.current_docname = "ok"

    def get_outdated_docs(self) -> set[str]:
        return self.env.found_docs

    def get_target_uri(self, docname: str, typ: str | None = None) -> str:
        return ''

    def write_doc(self, docname: str, doctree: nodes.document) -> None:
        self.write_doctree('x', doctree)
        InventoryFile.dump(self.outdir / "objects.inv", self.env, self)

    def finish(self) -> None:
        pass

def setup(app: Sphinx):
    app.add_builder(ObjectsBuilder)

    return {
            'parallel_read_safe': True,
            'parallel_write_safe': True,
    }
