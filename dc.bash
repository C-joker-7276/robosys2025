#!/bin/bash
# SPDX- SPDX-FileCopyrightText: 2025 C-joker
# SPDX-License-Identifier: BSD-3-Clause

if [[ "$1" =~ ^[0-9]{8}$ ]]; then
    today=$(date +%s)
    target=$(date -d "$1" +%s)
    diff_days=$(( (target - today) / 86400 ))
    echo "$diff_days 日後"
else
    echo "please write YYYYMMDD"
fi
