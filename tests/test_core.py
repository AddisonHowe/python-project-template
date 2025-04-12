"""Tests for core functions.

"""

import pytest

from myproject.core import foo

###################
##  Begin Tests  ##
###################

@pytest.mark.parametrize('arg, expected', [
    [True, True],
    [False, False],
])
def test_placeholder(arg, expected):
    assert foo(arg) == expected, "Failed placeholder test!"
