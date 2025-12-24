#!/bin/bash
# SPDX- SPDX-FileCopyrightText: 2025 C-joker
# SPDX-License-Identifier: BSD-3-Clause

if ! echo "$1" | grep -qE '^[0-9]{8}$'; then
	echo "please write YYYYMMDD"
	exit 1
fi
target=$(date -d "$1" +$s 2>/dev/null)
if [[ -z "$target" ]];then
	echo "please write YYYYMMDD"
	exit 1
fi
today=$(date +%s)
diff_days=$(( (target - today) / 86400 ))
echo "$diff_days 日後"
