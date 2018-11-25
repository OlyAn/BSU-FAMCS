#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import tests
from encoders import CaesarEncoder, VigenereEncoder
from hackers import Kasiski, Analyzer

LANG = 'en'
CAESAR_SHIFT = 7
VIGENERE_KEY_WORD = 'KEY'

with open(f'inputs/text_{LANG}.txt') as data_file:
    data = data_file.read()


with open('output/output.txt', 'w+') as fout:
    caesar = CaesarEncoder(CAESAR_SHIFT, LANG)
    encrypted = caesar.encrypt(data)
    decrypted = caesar.decrypt(encrypted)
    fout.write('CAESAR:\n')
    fout.write(f'TEXT:\t{data}\n')
    fout.write(f'ENCRYPTED:\n{encrypted}\n')
    fout.write(f'DECRYPTED:\n{decrypted}\n')
    fout.write('_' * 300 + '\n')

    vigenere = VigenereEncoder(VIGENERE_KEY_WORD, LANG)
    encrypted = vigenere.encrypt(data)
    decrypted = vigenere.decrypt(encrypted)
    fout.write('VIGENERE:\n')
    fout.write(f'TEXT:\t{data}\n')
    fout.write(f'ENCRYPTED:\n{encrypted}\n')
    fout.write(f'DECRYPTED:\n{decrypted}\n')
    fout.write('_' * 300 + '\n')

    kasiski = Kasiski(3, LANG)
    length = kasiski.get_len(encrypted)
    fout.write('KASISKI:')
    fout.write(f'KEYWORD LENGTH:\t{length}')

    analyzer = Analyzer(length, LANG)
    keyword = analyzer.find_keyword(encrypted)
    fout.write(f'FOUND KEYWORD:\t{keyword.upper()}')
    fout.write('_' * 300 + '\n')

    tests.run()
