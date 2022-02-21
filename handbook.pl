% Реализуйте некоторый справочник вида unit(key, value).
% В справочнике должно быть не менее 10 unit.
% В данном справочнике key - имя дизайнера настольной игры, а value - ее название

boardgame("Isaac Childres", "Gloomhaven").
boardgame("Isaac Childres", "Gloomhaven: Jaws of the Lion").
boardgame("Isaac Childres", "Forge War").
boardgame("Rob Daviau", "Pandemic Legacy: Season 1").
boardgame("Matt Leacock", "Pandemic Legacy: Season 1").
boardgame("Rob Daviau", "Cthulhu: Death May Die").
boardgame("Eric M. Lang", "Cthulhu: Death May Die").
boardgame("R. Eric Reuss", "Spirit Island").
boardgame("Paul Dennen", "Dune: Imperium").
boardgame("Jamey Stegmaier", "Scythe").
boardgame("Adam Kwapinski", "Nemesis").
boardgame("Antoine Bauza", "7 Wonders Duel").
boardgame("Bruno Cathala", "7 Wonders Duel").
boardgame("Elizabeth Hargrave", "Wingspan").

% Небольшое описание настольных игр
% boardgame_desc(Title, Year, Min_players, Max_players, Best_players, Description)
boardgame_desc("Gloomhaven", 2018, 1, 4, 3,
               "Vanquish monsters with strategic cardplay. Fulfill your quest to leave your legacy!").
boardgame_desc("Gloomhaven: Jaws of the Lion", 2020, 1, 4, 2,
               "Vanquish monsters with strategic cardplay in a 25-scenario Gloomhaven campaign.").
boardgame_desc("Forge War", 2015, 1, 4, 3,
               "Mine ore & forge weapons for adventurers to go on quests to fight deepening darkness.").
boardgame_desc("Pandemic Legacy: Season 1", 2015, 2, 4, 4,
               "Mutating diseases are spreading around the world - can your team save humanity?").
boardgame_desc("Cthulhu: Death May Die", 2019, 1, 4, 3,
               "Disrupt the ritual and slay the Elder Gods in this co-op dice chucker.").
boardgame_desc("Spirit Island", 2017, 1, 4, 2,
               "Island Spirits join forces using elemental powers to defend their home from invaders.").
boardgame_desc("Spirit Island", 2020, 1, 4, 3,
               "Influence, intrigue, and combat in the universe of Dune.").
boardgame_desc("Scythe", 2016, 1, 5, 4,
               "Five factions vie for dominance in a war-torn, mech-filled, dieselpunk 1920s Europe").
boardgame_desc("Nemesis", 2018, 1, 5, 4,
               "Survive an alien-infested spaceship but beware of other players and their agendas.").
boardgame_desc("7 Wonders Duel", 2015, 2, 2, 2,
               "Science? Military? What will you draft to win this head-to-head version of 7 Wonders?").
boardgame_desc("Wingspan", 2019, 1, 4, 3,
               "Attract a beautiful and diverse collection of birds to your wildlife reserve.").


has_no_boardgames(Designer) :-
    not(boardgame(Designer, _)).

% Запросить из консоли key - имя дизайнера
% и распечатать все созданные им игры
% (в случае отсутствия игр сообщить об этом)
boardgames :-
    writeln("Enter designer name: "),
    read(Designer),
    (
        has_no_boardgames(Designer),
        writeln("This designer has no boardgames");
        writeln("Boardgames:"),
        print_boardgames(Designer)
    ).

print_boardgames(Designer) :-
    boardgame(Designer, Title),
    write("\t- \""),
    write(Title),
    write("\", "),
    boardgame_desc(Title, Year, Min_players, Max_players, Best_players, Description),
    writeln(Year),
    write("\t  "),
    write("Number of players: "),
    write(Min_players),
    write("-"),
    write(Max_players),
    write(" (Best: "),
    write(Best_players),
    writeln(")"),
    write("\t  "),
    writeln(Description),
    nl,
    fail;
    true.


has_no_designers(Title) :-
    not(boardgame(_, Title)).

% Запросить из консоли value - название настольной игры
% и распечатать её дизайнер(а/ов)
% (в случае отсутствия игры сообщить об этом)
designers :-
    writeln("Enter boardgame title: "),
    read(Title),
    (
        has_no_designers(Title),
        writeln("This game is not in the database");
        writeln("Designer(s):"),
        print_designers(Title)
    ).

print_designers(Title) :-
    boardgame(Designer, Title),
    write("\t- "),
    writeln(Designer),
    fail;
    true.

% Цель 1: найти игры дизайнера
% ?-boardgames.

% Цель 2: найти дизайнер(а/ов) игры:
% ?-designers.