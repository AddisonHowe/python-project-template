"""Pytest Configuration File

"""

import pytest
import shutil

DATDIR = "tests/data"  # data directory for all tests.
TMPDIR = "tests/_tmp"  # output directory for all tests.

def remove_dir(dir:str):
    """Helper function to remove a directory recursively."""
    if not dir.startswith(TMPDIR):
        msg = f"Can only use function `remove_dir` from tests.conftest to \
        remove directories in the directory {TMPDIR}. Got: {dir}"
        raise RuntimeError(msg)
    shutil.rmtree(dir)

#####################
##  Configuration  ##
#####################

def pytest_addoption(parser):
    parser.addoption(
        "--benchmark", action="store_true", default=False, 
        help="run benchmarking tests"
    )

def pytest_configure(config):
    config.addinivalue_line("markers", "benchmark: mark test as benchmarking")

def pytest_collection_modifyitems(config, items):
    benchmark_flag_given = False
    if config.getoption("--benchmark"):
        # --benchmark given in cli: do not skip benchmarking tests
        benchmark_flag_given = True
    skip_benchmark = pytest.mark.skip(reason="need --benchmark option to run")
    for item in items:
        if "benchmark" in item.keywords and not benchmark_flag_given:
            item.add_marker(skip_benchmark)
