#!/usr/bin/env python3


class CGECoreOut(Exception):
    """ Root for all submodule out exceptions in the cgecore module.
        Only used to enable "except" of all exceptions from submodule.
        Never raised.
    """
    pass


class CGECoreOutTypeError(CGECoreOut):
    """ Raised when the 'type' specified is not defined in the json
        definition, if it is missing.
    """
    def __init__(self, message, *args):
        self.message = message
        # allow users initialize misc. arguments as any other builtin Error
        super(CGECoreOutTypeError, self).__init__(message, *args)


class CGECoreOutInputError(CGECoreOut):
    """ Raised when some of the data stored in a Result object did not pass
        validation based on the JSON definition.
    """
    def __init__(self, message, errors, *args):
        self.message = message
        self.errors = errors
        # allow users initialize misc. arguments as any other builtin Error
        super(CGECoreOutInputError, self).__init__(message, errors, *args)


class CGECoreOutTranslateError(CGECoreOut):
    """ Raised when keys for the given type of Translate object does not match"
        a key in the JSON definition
    """
    def __init__(self, message, *args):
        self.message = message
        # allow users initialize misc. arguments as any other builtin Error
        super(CGECoreOutTranslateError, self).__init__(message, *args)
