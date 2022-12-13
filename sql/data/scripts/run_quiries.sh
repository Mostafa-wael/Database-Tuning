#!/bin/bash
set -e
psql  -U postgres -a -f /mnt/queries/index_optimization_hash.sql
