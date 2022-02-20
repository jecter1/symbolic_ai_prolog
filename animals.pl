% 1. Челси — коричневая кошка.
% 2. Багира — черная кошка.
% 3. Соня — рыжая кошка.
% 4. Рекс — черная собака.
% 5. Найда — рыжая собака.
% 6. Шарик — белая собака.

cat(chelsy).
cat(bagira).
cat(sonya).

dog(rex).
dog(naida).
dog(sharik).

color(chelsy, brown).
color(bagira, black).
color(sonya, red).
color(rex, black).
color(naida, red).
color(sharik, white).

%  Определение животного.
animal(X) :-
	dog(X); cat(X).

% 7. Все животные, которыми владеют Иван и Анна, имеют родословные.
has_pedigree(X) :-
	animal(X),
	(own(ivan, X); own(anna, X)).

% 8. Иван владеет всеми черными и коричневыми животными.
own(ivan, X) :-
	animal(X),
	(color(X, black); color(X, brown)).

% 9. Анна владеет всеми кошками небелого цвета, которые не являются собственностью Ивана.
own(anna, X) :-
	cat(X),
	not(color(X, white)),
	not(own(ivan, X)).

% 10. Петр владеет Найдой, если Анна не владеет Рексом и если Шарик не имеет родословной.
own(petr, naida) :-
	not(own(anna, rex)),
	not(has_pedigree(sharik)).

% Цель: найти животных, не имеющих хозяев.
% ?-animal(X), not(own(_, X)).
