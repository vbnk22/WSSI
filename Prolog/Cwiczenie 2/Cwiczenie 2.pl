rodzic(patryk, andrzej).
rodzic(patryk, lucyna).
rodzic(kamil, andrzej).
rodzic(kamil, lucyna).
rodzic(lucyna, maria).
rodzic(andrzej, alicja).
rodzic(andrej, maria).
rodzic(paulina, andrej).
rodzic(andrzej, stefan).
rodzic(lucyna, janusz).
rodzic(andrej, janusz).
rodzic(hawier, andrzej).
rodzic(hawier, ewelina).
rodzic(maria, eugeniusz).
rodzic(maria, halina).
rodzic(stefan, jola).
rodzic(stefan, marcin).

mezczyzna(andrzej).
mezczyzna(patryk).
mezczyzna(kamil).
mezczyzna(andrej).
mezczyzna(hawier).
mezczyzna(stefan).
mezczyzna(janusz).
mezczyzna(eugeniusz).
mezczyzna(marcin).

osoba(kamil).
osoba(patryk).
osoba(andrzej).
osoba(lucyna).
osoba(stefan).
osoba(maria).
osoba(alicja).
osoba(hawier).
osoba(paulina).
osoba(andrej).
osoba(ewelina).
osoba(janusz).
osoba(alicja).
osoba(marcin).
osoba(eugeniusz).
osoba(halina).
osoba(jola).

/*1*/
kobieta(Kobieta) :-
    osoba(Kobieta),
    \+mezczyzna(Kobieta).

/*2*/
ojciec(Ojciec, Dziecko) :-
    mezczyzna(Ojciec),
    rodzic(Dziecko, Ojciec),
    osoba(Dziecko),
    osoba(Ojciec),
    Ojciec \= Dziecko.

/*3*/
matka(Matka, Dziecko) :-
    kobieta(Matka),
    rodzic(Dziecko, Matka),
    osoba(Dziecko),
    osoba(Matka),
    Matka \= Dziecko.

/*4*/
corka(Corka, Rodzic) :-
    kobieta(Corka),
    rodzic(Corka, Rodzic),
    osoba(Corka),
    osoba(Rodzic),
    Corka \= Rodzic.

/*5*/
brat_rodzony(Brat, Rodzenstwo) :-
    mezczyzna(Brat),
    rodzic(Brat, Matka),
    rodzic(Brat, Ojciec),
    rodzic(Rodzenstwo, Ojciec),
    rodzic(Rodzenstwo, Matka),
    osoba(Brat),
    osoba(Rodzenstwo),
    osoba(Matka),
    osoba(Ojciec),
    Brat \= Rodzenstwo.

/*6*/
brat_przyrodni(BratPrzyrodni, Rodzenstwo) :-
    mezczyzna(BratPrzyrodni),
    rodzic(BratPrzyrodni, Rodzic),
    rodzic(Rodzenstwo, Rodzic),
    rodzic(BratPrzyrodni, Rodzic2),
    rodzic(Rodzenstwo, Rodzic3),
    osoba(Rodzenstwo),
    osoba(BratPrzyrodni),
    osoba(Rodzic),
    osoba(Rodzic2),
    osoba(Rodzic3),
    Rodzic2 \= Rodzic3,
    BratPrzyrodni \= Rodzenstwo.

/*7*/
kuzyn(Kuzyn1, Kuzyn2) :-
    rodzic(Kuzyn1, Rodzic1),
    rodzic(Kuzyn2, Rodzic2),
    rodzic(Rodzic1, Dziadek),
    rodzic(Rodzic2, Dziadek),
    osoba(Kuzyn1),
    osoba(Kuzyn2),
    osoba(Rodzic1),
    osoba(Rodzic2),
    osoba(Dziadek),
    Kuzyn1 \= Kuzyn2.

/*8*/
dziadek_od_strony_ojca(Dziadek, Dziecko) :-
    ojciec(Ojciec, Dziecko),
    ojciec(Dziadek, Ojciec),
    osoba(Dziecko),
    osoba(Dziadek),
	osoba(Ojciec),
    Dziadek \= Dziecko.

/*9*/
dziadek_od_strony_matki(Dziadek, Dziecko) :-
    matka(Matka, Dziecko),
    ojciec(Dziadek, Matka),
    osoba(Dziecko),
    osoba(Dziadek),
	osoba(Matka),
    Dziadek \= Dziecko.

/*10*/
dziadek(Dziadek, Dziecko) :-
    rodzic(Dziecko, Rodzic),
    ojciec(Dziadek, Rodzic),
    osoba(Dziadek),
    osoba(Dziecko),
    osoba(Rodzic),
    Dziadek \= Dziecko.

/*11*/
babcia(Babcia, Dziecko) :-
    rodzic(Dziecko, Rodzic),
    matka(Babcia, Rodzic),
    osoba(Babcia),
    osoba(Dziecko),
    osoba(Rodzic),
    Babcia \= Dziecko.

/*12*/
wnuczka(Dziadek, Wnuczka) :-
    kobieta(Wnuczka),
    (
    	babcia(Dziadek, Wnuczka);
    	dziadek(Dziadek, Wnuczka)
    ),
    osoba(Dziadek),
    osoba(Wnuczka),
    Dziadek \= Wnuczka.

/*13*/
przodek_do2pokolenia_wstecz(Dziadek, Dziecko) :-
    dziadek(Dziadek, Dziecko);
    babcia(Dziadek, Dziecko),
    osoba(Dziecko),
    osoba(Dziadek),
    Dziadek \= Dziecko.

/*14*/
przodek_do3pokolenia_wstecz(Pradziadek, Dziecko) :-
    (	
    	babcia(Dziadek, Dziecko), rodzic(Dziadek, Pradziadek);
    	dziadek(Dziadek, Dziecko), rodzic(Dziadek, Pradziadek)
    ),
    osoba(Pradziadek),
    osoba(Dziecko),
    osoba(Dziadek),
    Pradziadek \= Dziecko.
