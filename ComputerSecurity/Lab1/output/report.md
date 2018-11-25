# Report
Vigenere Cipher by Ivan Pazhitnykh
## test 1: with fixed keyword length
text len|keyword|: len|found keyword|: len|success probability
---|---|---|---|---|---
583|THREATEN|8|AHVRJIEJ|8|25%
729|THREATEN|8|THRIETED|8|62%
1459|THREATEN|8|THREZTEU|8|75%
2919|THREATEN|8|THREATEN|8|100%
5109|THREATEN|8|TCREATEN|8|87%
7299|THREATEN|8|THFEMTEN|8|75%
10219|THREATEN|8|THREATEN|8|100%
11679|THREATEN|8|THREATEN|8|100%
13139|THREATEN|8|THREATEN|8|100%
14599|THREATEN|8|THREATEN|8|100%

![test1](./images/test1.png)
## test 2: with fixed text length
text len|keyword|: len|found keyword|: len|success probability
---|---|---|---|---|---
6000|BE|2|BE|2|100%
6000|WAY|3|WAY|3|100%
6000|PATH|4|PATH|4|100%
6000|FORCE|5|FORCE|5|100%
6000|GINGER|6|GINGER|6|100%
6000|PUNCHED|7|I|1|0%
6000|THREATEN|8|THFEATEN|8|87%
6000|TELEPATHY|9|TELEPATHY|9|100%
6000|LUMBERJACK|10|SUMBERJACK|10|90%
6000|MOZZARELLAS|11|MOZNAAYSLAS|11|63%

![test2](./images/test2.png)
