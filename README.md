# Byterun (Python 3.5 Fork)

This is a fork of Ned Batchelder's Byterun, a pure-Python Python bytecode interpreter.
This version has been partially updated to target Python 3.5 compatibility, removing Python 2 support and the `six` library.

## Running Tests with Docker

A `Dockerfile` and `Makefile` are provided to simplify testing in a consistent Python 3.5 environment.

**Prerequisites:**

*   Docker installed and running.
*   `make` command available.

**Instructions:**

1.  **Build the Docker image:**
    ```bash
    make build
    ```
    This command uses the `Dockerfile` to create an image named `byterun-test:py35` containing the code and necessary dependencies (`pytest`).

2.  **Run the tests:**
    ```bash
    make test
    ```
    This command will build the image if it doesn't exist, then run the tests (`tests/test_basic.py` and `tests/test_functions.py`) inside a container using the built image. Test results will be printed to your console.

**Other Makefile Commands:**

*   `make shell`: Start an interactive bash shell inside the container for debugging or exploration.
*   `make clean`: Remove the built Docker image (`byterun-test:py35`).

## Known Issues

As of the last update, the following tests in `tests/test_basic.py` and `tests/test_functions.py` might still fail due to subtle differences in error message formatting compared to CPython 3.5:

- FAILED tests/test_basic.py::TestIt::test_calling_methods_wrong - AssertionErr...
- FAILED tests/test_basic.py::TestIt::test_dict_comprehension - AssertionError
- FAILED tests/test_functions.py::TestFunctions::test_different_globals_may_have_different_builtins
- FAILED tests/test_functions.py::TestFunctions::test_no_builtins - AssertionEr...
- FAILED tests/test_functions.py::TestGenerators::test_generator_from_generator2
========================= 5 failed, 73 passed in 0.12s =========================

*(Note: The original project has a more extensive test suite. This fork focuses primarily on `test_basic.py` and `test_functions.py` for the Python 3.5 update.)*
