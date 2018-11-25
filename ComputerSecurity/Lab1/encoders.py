#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from utils import shift, frequencies, freq_to_sorted_list


class WithLanguage:
    def __init__(self, lang):
        freq = frequencies.get(lang)
        if not freq:
            raise ValueError(f'Unsupported language {lang}')
        self.lang = lang
        self.known_freq = freq_to_sorted_list(freq)
        self.alphabet = sorted(list(freq.keys()))


class CaesarEncoder(WithLanguage):
    def __init__(self, shift_value, lang):
        super(CaesarEncoder, self).__init__(lang)
        self.shift_value = shift_value

    @staticmethod
    def process_string(string, shift_value, alphabet):
        return ''.join([shift(c, shift_value, alphabet) for c in string])

    def encrypt(self, string):
        return CaesarEncoder.process_string(string, self.shift_value, self.alphabet)

    def decrypt(self, string):
        return CaesarEncoder.process_string(string, -self.shift_value, self.alphabet)


class VigenereEncoder(WithLanguage):
    def __init__(self, keyword, lang):
        super(VigenereEncoder, self).__init__(lang)
        self.keyword = keyword
        self.shift_values = [ord(c.lower()) - ord(self.alphabet[0]) for c in keyword]

    def process_string(self, string, encrypting=True):
        shift_values = self.shift_values
        period = len(self.keyword)

        parts = [string[i::period] for i in range(period)]
        shift_direction = 1 if encrypting else -1

        result_parts = [
            CaesarEncoder.process_string(
                parts[i],
                shift_direction * shift_values[i],
                self.alphabet)
            for i in range(period)
        ]

        letters = []
        for j in range(len(result_parts[0])):
            for i in range(period):
                if j < len(result_parts[i]):
                    letters.append(result_parts[i][j])

        return ''.join(letters)

    def encrypt(self, string):
        return self.process_string(string)

    def decrypt(self, string):
        return self.process_string(string, encrypting=False)
