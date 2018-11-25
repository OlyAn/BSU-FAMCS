#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
from math import ceil
from encoders import WithLanguage
from utils import contains_only_letters, list_gcd, freq_to_sorted_list, shift

DIFF_THRESHOLD = 0.1


class Kasiski(WithLanguage):
    def __init__(self, length, lang):
        super(Kasiski, self).__init__(lang)
        self.k = length

    def get_gramms(self, text):
        """
        Calculates the keyword length for the encrypted text

        :param  text:    string  encrypted text

        :return gramms and their start indexes dictionary
        """
        gramms = {}
        for i in range(len(text) - self.k):
            substr = text[i:i + self.k]
            if not contains_only_letters(substr, self.lang) or gramms.get(substr):
                continue

            # find start indexes of all repeating k-sequences
            matches = [m.start() for m in re.finditer(f'(?={substr})', text)]
            if len(matches) > 1:
                gramms[substr] = matches
        return gramms

    @staticmethod
    def get_differencies(gramms_index_of_appearances):
        """
        Calculates the differences based on the repeating gramms start indexes

        :param  gramms_index_of_appearances: array of arrays     start indexes of repeating gramms

        :return distances:  array
        """
        diffs = {}  # keys are distances, values are list of int spacings
        for el in gramms_index_of_appearances:
            for i in range(1, len(el)):
                distance = el[i] - el[i - 1]
                diffs[distance] = diffs.get(distance, 0) + 1

        common_diff = diffs[max(diffs, key=lambda k: diffs[k])]
        min_accepted_diff = ceil(common_diff * DIFF_THRESHOLD)
        return [key for key in diffs if diffs[key] > min_accepted_diff]

    def get_len(self, encrypted):
        """
        Calculates the keyword length for the encrypted text

        :param encrypted string     encrypted text

        :return keyword length
        """
        gramms = self.get_gramms(encrypted.lower())
        diffs = self.get_differencies(list(gramms.values()))
        gcd = list_gcd(diffs)
        return gcd


class Analyzer(WithLanguage):
    def __init__(self, length, lang):
        """
        :param length string    keyword length
        :param lang string      language
        """
        super(Analyzer, self).__init__(lang)
        self.length = length

    @staticmethod
    def count_frequencies(string, alphabet):
        letters_count = dict.fromkeys(alphabet, 0)
        escaped = 0
        for c in string:
            if letters_count.get(c.lower()) is not None:
                letters_count[c.lower()] += 1
            else:
                escaped += 1
        string_len = len(string) - escaped
        return {letter: count / string_len for letter, count in letters_count.items()}

    @staticmethod
    def next_freq_closer(value, known_freq):
        return abs(value - known_freq[0]['freq']) > abs(value - known_freq[1]['freq'])

    @staticmethod
    def count_shift(a, b):
        return ord(a['letter']) - ord(b['letter'])

    def find_keyword_letter(self, string):
        shifts = {}
        known_freq = self.known_freq[:]
        freq = freq_to_sorted_list(Analyzer.count_frequencies(string, self.alphabet))
        for el in freq:
            i = 0
            while i < len(known_freq) - 1:
                closest = known_freq[i]
                if not self.next_freq_closer(el['freq'], known_freq[i:]):
                    break
                i += 1
            shift_value = self.count_shift(el, closest)
            shifts[shift_value] = shifts.get(shift_value, 0) + 1

        common_shift = max(shifts, key=lambda k: shifts[k])
        return shift(self.alphabet[0], common_shift, self.alphabet)

    def find_keyword(self, string):
        parts = [string[i::self.length] for i in range(self.length)]
        letters = list(map(self.find_keyword_letter, parts))
        return ''.join(letters)
