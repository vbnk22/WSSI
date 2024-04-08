rodzic(patryk, andrzej).
rodzic(patryk, lucyna).
rodzic(kamil, andrzej).
rodzic(kamil, lucyna).
rodzic(lucyna, maria).
rodzic(andrej, maria).
rodzic(paulina, andrej).
rodzic(andrzej, stefan).
rodzic(hawier, andrzej).
rodzic(hawier, ewelina).

/*A*/
rodzenstwo(Brat, Siostra) :-
    rodzic(Brat, Rodzic),
    rodzic(Siostra, Rodzic).
/*B*/
kuzyni(Kuzyn1, Kuzyn2) :-
    rodzic(Kuzyn1, Rodzic1),
    rodzic(Kuzyn2, Rodzic2),               
    rodzenstwo(Rodzic1, Rodzic2).
/*C*/
tesciowie(Dziadek, Babcia) :-
    rodzic(Dziecko, Matka),
    rodzic(Dziecko, Ojciec),
    (
        (rodzic(Ojciec, Dziadek), rodzic(Matka, Babcia));
        (rodzic(Ojciec, Babcia), rodzic(Matka, Dziadek))
    ).
/*D*/
rodzic_przyrodni(Dziecko, MatkaPrzyrodnia) :-
    rodzic(Dziecko, Rodzic),
    rodzic(Dziecko2, Rodzic),
    rodzic(Dziecko2, MatkaPrzyrodnia).
/*E*/
rodzenstwo_przyrodnie(Brat, Siostra) :-
    rodzic_przyrodni(Brat, Rodzic),
    rodzic_przyrodni(Siostra, Rodzic).
/*F*/
szwagrowie(Szwagier1, Szwagier2) :-
    rodzic(Dziecko, Szwagier1),
    rodzic(Dziecko, Rodzic),
    rodzenstwo(Rodzic, Szwagier2).