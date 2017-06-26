import ranger.api
import ranger.core.linemode


@ranger.api.register_linemode     # It may be used as a decorator too!
class CommentsLinemode(ranger.core.linemode.LinemodeBase):
    name = "comments"

    uses_metadata = True
    required_metadata = ["comment"]

    def filetitle(self, file, metadata):
        return file.relative_path + " # " + metadata.comment

    def infostring(self, file, metadata):
        return file.user
