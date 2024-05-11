#!/bin/bash

source $(dirname $0)/default_var

function cv() {
    if [ $# != 2 ]; then
        echo 引数は2つ設定してください。
        return
    fi
    case "$1" in
    int | [iu][0-9][0-9]) from_int $2 ;;
    char) from_char $2 ;;
    alpha) from_alpha $2 ;;
    str | String) from_str $2 ;;
    *) echo "NOT SUPPORTED" ;;
    esac
}

function from_int() {
    echo "int -> $1"
    case "$1" in
    "char")
        echo ${INT_CHAR}
        echo ${INT_CHAR} | clip
        ;;
    "alpha")
        echo ${INT_ALPHA}
        echo ${INT_ALPHA} | clip
        ;;
    str | String)
        echo ${INT_STR}
        echo ${INT_STR} | clip
        ;;
    *) echo "NOT SUPPORTED" ;;
    esac
}

function from_char() {
    echo "char -> $1"
    case "$1" in
    int | [iu][0-9][0-9])
        echo ${CHAR_INT}
        echo ${CHAR_INT} | clip
        ;;
    str | String)
        echo ${CHAR_STR}
        echo ${CHAR_STR} | clip
        ;;
    *) echo "NOT SUPPORTED" ;;
    esac
}

function from_alpha() {
    echo "alpha -> $1"
    case "$1" in
    int | [iu][0-9][0-9])
        echo ${ALPHA_INT}
        echo ${ALPHA_INT} | clip
        ;;
    str | String)
        echo ${CHAR_STR}
        echo ${CHAR_STR} | clip
        ;;
    *) echo "NOT SUPPORTED" ;;
    esac
}

function from_str() {
    echo "str -> $1"
    case "$1" in
    int | [iu][0-9][0-9])
        echo ${STR_INT}
        echo ${STR_INT} | clip
        ;;
    char | alpha)
        echo ${STR_CHAR}
        echo ${STR_CHAR} | clip
        ;;
    *) echo "NOT SUPPORTED" ;;
    esac
}

INT_CHAR="std::char::from_digit(${INT} as u32, 10).unwrap()"
INT_ALPHA="(b'a' + ${INT} as u8) as char"
INT_STR="${INT}.to_string()"
CHAR_INT="${CHAR}.to_digit(10).unwrap() as usize"
CHAR_STR="${CHAR}.iter().collect::<String>()"
ALPHA_INT="(${CHAR} as u8 - b'a') as usize"
STR_INT="${STR}.parse::<usize>().unwrap()"
STR_CHAR="${STR}.chars().collect::<Vec<char>>()"
