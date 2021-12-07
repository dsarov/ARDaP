#!/usr/bin/env python3


class DuplicateKeyError(Exception):
    """ Raise when adding the same key to a dict twice."""
    def __init__(self, message, *args):
        self.message = message
        # allow users initialize misc. arguments as any other builtin Error
        super(DuplicateKeyError, self).__init__(message, *args)


class LockedObjectError(Exception):
    """ Raise when attempting to alter a locked object."""
    def __init__(self, message, *args):
        self.message = message
        # allow users initialize misc. arguments as any other builtin Error
        super(LockedObjectError, self).__init__(message, *args)
