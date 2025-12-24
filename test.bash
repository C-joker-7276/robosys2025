#!/bin/bash
# SPDX-FileCopyrightText: 2025 C-joker
# SPDX-License-Identifier: BSD-3-Clause
set -e

while IFS=: read -r input expected; do
    echo ">>> Testing $input"

    output=$(./days.sh "$input" 2>&1 || true)

    if [[ "$expected" == "ERR" ]]; then
        if [[ "$output" == *"please write"* ]]; then
            echo "OK (error expected)"
        else
            echo "FAIL: expected error, got '$output'"
            exit 1
        fi
    else
        # 数字だけ抽出
        result=$(echo "$output" | grep -oE '^-?[0-9]+')
        if [[ "$result" == "$expected" ]]; then
            echo "OK ($result)"
        else
            echo "FAIL: expected $expected, got $result"
            exit 1
        fi
    fi
done < test_cases.txt

echo "All tests passed"
