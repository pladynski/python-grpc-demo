#!/bin/bash
# Hosts the Users service with Graftcode Gateway instead of the gRPC server.
# Needs: gg (https://github.com/grft-dev/graftcode-gateway/releases), Python with
# grpcio/protobuf/graftcode-context installed, and protos built into ./gen-py.
# If gg cannot find libpython, set HYPERTUBE_PYTHON_RUNTIME_PATH=/path/to/libpython3.x.so
cd "$(dirname "$0")"
export USERS_SERVER_PY="$PWD/server/server.py"
export PYTHONPATH="${GEN_PY:-$PWD/gen-py}${PYTHONPATH:+:$PYTHONPATH}"
exec gg --runtime python --modules ./graft/ --port "${GG_PORT:-50051}" --httpPort "${GG_HTTP_PORT:-50052}"
