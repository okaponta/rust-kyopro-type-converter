#!/bin/bash

source ./default_var

function cv() {
    if [ $# != 2 ]; then
        echo 引数は2つ設定してください。
        return
    fi
    case "$1" in
    int | [iu][0-9][0-9]) from_int $2 ;;
    char | alpha) from_char $2 ;;
    str | String) from_str $2 ;;
    *) echo "NOT SUPPORTED" ;;
    esac
}

function from_int() {
    echo "int -> $1"
    case "$1" in
    "char")
        echo ${INT_CHAR}
        echo ${INT_CHAR} | pbcopy
        ;;
    "alpha")
        echo ${INT_ALPHA}
        echo ${INT_ALPHA} | pbcopy
        ;;
    str | String)
        echo ${INT_STR}
        echo ${INT_STR} | pbcopy
        ;;
    *) echo "NOT SUPPORTED" ;;
    esac
}

function from_char() {
    echo "char -> $1"
    case "$1" in
    int | [iu][0-9][0-9])
        echo ${CHAR_INT}
        echo ${CHAR_INT} | pbcopy
        ;;
    str | String)
        echo ${CHAR_STR}
        echo ${CHAR_STR} | pbcopy
        ;;
    *) echo "NOT SUPPORTED" ;;
    esac
}

function from_str() {
    echo "str -> $1"
    case "$1" in
    int | [iu][0-9][0-9])
        echo ${STR_INT}
        echo ${STR_INT} | pbcopy
        ;;
    char | alpha)
        echo ${STR_CHAR}
        echo ${STR_CHAR} | pbcopy
        ;;
    *) echo "NOT SUPPORTED" ;;
    esac
}

INT_CHAR="std::char::from_digit(${INT} as u8, 10).unwrap()"
INT_ALPHA="(b'a' + (${INT} - 1) as u8) as char"
INT_STR="${INT}.to_string()"
CHAR_INT="${CHAR}.to_digit(10).unwrap() as i32"
CHAR_STR="${CHAR}.iter().collect::<String>()"
STR_INT="${STR}.parse::<i32>().unwrap()"
STR_CHAR="${STR}.chars().collect::<Vec<char>>()"
