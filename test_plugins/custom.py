from __future__ import (absolute_import, division, print_function)
from ansible import errors
from jinja2.runtime import Undefined
__metaclass__ = type


def contains(haystack, needle):
    return bool(needle in haystack)


def equalto(value, other):
    if isinstance(value, Undefined):
        return False
    return bool(value == other)


class TestModule(object):
    ''' Ansible jinja2 tests '''

    def tests(self):
        return {
            'contains': contains,
            'defined_and_equalto': equalto,
        }
