#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import re
from functools import reduce
from math import gcd

LETTERS_REGEXPS = {
    'en': re.compile('^[a-zA-Z]+$'),
    'ru': re.compile('^[а-яА-Я]+$')
}

with open('inputs/frequencies.json') as data_file:
    frequencies = json.load(data_file)


def shift(char, shift_value, alphabet):
    if char.lower() not in alphabet:
        return char

    index = ord(char.lower()) - ord(alphabet[0]) + shift_value
    next_char = alphabet[index % len(alphabet)]
    return next_char.upper() if char.istitle() else next_char


def contains_only_letters(text, lang):
    """
    Checks if string contains only letters from the given language

    :param text:    string
    :param lang:    string
    :return:
    """
    pattern = LETTERS_REGEXPS.get(lang)
    if not pattern:
        raise ValueError(f'Unsupported language {lang}')
    return bool(pattern.match(text))


def list_gcd(numbers):
    return reduce(gcd, numbers)


def freq_to_sorted_list(dict):
    return sorted([{'letter': k, 'freq': v} for k, v in dict.items()], key=lambda x: x['freq'], reverse=True)
