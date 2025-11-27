#!/bin/bash
# SPDX-FileCopyrightText: 2025 C-joker
# SPDX-License-Identifier: BSD-3-Clause

#bashrcの中に関数化して書かないと動かないよ

#初期定義
num=$1
result=""

#入力チェック(正の整数以外だと困るため)
if ! [[ "$num" =~ ^[0-9]+$ ]] || [ "$num" -le 0 ]; then
	echo "error,this is not natural number"
	exit 1
fi
#入力された数字分、"../"を追加する
for ((i=1; i<=num; i++)); do
	result="${result}../"
done
#戻る、もしrootを超えて戻ろうとした場合は１を返す
cd "$result" || {
	echo "Failed,move over root"
	exit 1
}
