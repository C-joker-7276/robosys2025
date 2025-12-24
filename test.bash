#!/bin/bash
# SPDX-FileCopyrightText: 2025 C-joker
# SPDX-License-Identifier: BSD-3-Clause
set -e

cd "$(dirname "$0")"

while IFS=: read -r input expected; do
    echo ">>> Testing $input"

    output=$(./dc.bash "$input" 2>&1 || true)

    if [[ "$expected" == "ERR" ]]; then
        # エラー系：エラーメッセージが含まれていれば OK
        if [[ "$output" == *"please write"* ]]; then
            echo "OK (error expected)"
        else
            echo "FAIL: expected error, got '$output'"
            exit 1
        fi
    else
        # 正常系：数字が返っていれば OK（値は問わない）
        result=$(echo "$output" | grep -oE '^-?[0-9]+')
        if [[ -n "$result" ]]; then
            echo "OK (number: $result)"
        else
            echo "FAIL: expected a number, got '$output'"
            exit 1
        fi
    fi
done < test_cases.txt

