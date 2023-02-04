
drop TABLE CurrentlyPlaying;
drop TABLE Songs;
drop TABLE Playlists;
drop TYPE SongsNestType FORCE;
drop TYPE Playlist FORCE;
drop TYPE Tracklist FORCE;
drop TYPE Artist FORCE;
drop TYPE MusicListener FORCE;
drop TYPE Song FORCE;



-- ************    CREATING TABLES AND TYPES     **************

CREATE TYPE Artist as OBJECT(
    username varchar(70),
    joinDate Date ,
    genre varchar(50),
    bio varchar(255)
);
/
CREATE TYPE Song as OBJECT(
    id VARCHAR(100),
    title VARCHAR(100),
    duration int,
    creator ARTIST
)NOT FINAL;
/
CREATE TABLE Songs OF SONG;
/
CREATE TYPE SongsNestType as TABLE OF SONG;
/

create Type MusicListener as OBJECT(
    id varchar(50) ,
    username varchar(70)
);
/

CREATE TYPE Tracklist as OBJECT(
    id VARCHAR(100), 
    owner MusicListener,
    songs SongsNestType
) 
NOT FINAL;
/

CREATE TYPE Playlist UNDER Tracklist(
    name VARCHAR(70)
) ;
/
CREATE TABLE Playlists OF Playlist NESTED TABLE songs STORE as playlistSongsNestTable ;
/

CREATE TABLE CurrentlyPlaying of Tracklist NESTED TABLE songs STORE as currentSongsNestTable ;
/


show ERRORS

DESC Artist
DESC songs
Desc playlists
Desc currentlyplaying
DESC MusicListener


--      **************  INSERTING DATA **********************/

INSERT INTO Songs VALUES ('Liarinth001001','Pygmalion',189, Artist('Liarinth', DATE '2014 -10-10', 'Electronic/Techno/Downtempo','Introducing you to a new world')); 

INSERT INTO Songs VALUES ('Liarinth001002','Vesper',259, Artist('Liarinth', DATE '2014 -10-10', 'Electronic/Techno/Downtempo','Introducing you to a new world')); 

INSERT INTO Songs VALUES ('Liarinth001003','Western Digital',324, Artist('Liarinth', DATE '2014 -10-10', 'Electronic/Techno/Downtempo','Introducing you to a new world')); 

INSERT INTO Songs VALUES ('KanyeWest001001','Yeezus',259, Artist('Kanye West', DATE '2009-02-12', 'HIp Hop','Beyonce had the greatest video of all time')); 

INSERT INTO Songs VALUES ('KanyeWest001002','Yeezy210',259, Artist('Kanye West', DATE '2009-02-12', 'HIp Hop','Beyonce had the greatest video of all time')); 

INSERT INTO Songs VALUES ('KanyeWest001003','Yeezy840',259, Artist('Kanye West', DATE '2009-02-12', 'HIp Hop','Beyonce had the greatest video of all time')); 

INSERT INTO Songs VALUES ('KayRab001001','Kaboom',259, Artist('KayRab', DATE '2015-02-12', 'Experimental','A young and upcoming producer that likes to play around with new sound')); 

INSERT INTO Songs VALUES ('KayRab001002','Dissolve',259, Artist('KayRab', DATE '2015-02-12', 'Experimental','A young and upcoming producer that likes to play around with new sound')); 

INSERT INTO Songs VALUES ('Jong Xina001001','Xuehua',256, Artist('Jong Xina', DATE '2012-02-12', 'Experimental','Representing the Republic')); 

INSERT INTO Songs VALUES ('JongXina001002','Not that red',159, Artist('Jong Xina', DATE '2012-02-12', 'Experimental','Representing the Republic')); 

INSERT INTO Songs VALUES ('BullMan001001','Cowboy blues',149, Artist('BullMan', DATE '2019-02-12', 'HIp Hop','Beyond your regular CowBoy'));

INSERT INTO Songs VALUES ('A$AP001001','Pretty Flacko',171, Artist('A$AP', DATE '2014-02-12', 'HIp Hop','Always Strive And Prosper'));

INSERT INTO Songs VALUES ('A$AP001002','Peso',196, Artist('A$AP', DATE '2014-02-12', 'HIp Hop','Always Strive And Prosper'));

INSERT INTO Songs VALUES ('A$AP001003','Gold',301, Artist('A$AP', DATE '2014-02-12', 'HIp Hop','Always Strive And Prosper'));





--     *****************        INSERT INTO Currently Playing      *****************

INSERT INTO CurrentlyPlaying (id, owner, songs) VALUES ('cp001',MusicListener('ml003','Goblinslayer22'), SongsNestType(
    Song('A$AP001003','Gold',301, Artist('A$AP', DATE '2014-02-12', 'HIp Hop','Always Strive And Prosper'))
));

INSERT INTO CurrentlyPlaying VALUES ('cp002',MusicListener('ml002','JustinTime99'),SongsNestType(
    Song('A$AP001002','Peso',196, Artist('A$AP', DATE '2014-02-12', 'HIp Hop','Always Strive And Prosper')), 
    Song('KanyeWest001002','Yeezy210',259, Artist('Kanye West', DATE '2009-02-12', 'HIp Hop','Beyonce had the greatest video of all time')),
    Song('A$AP001001','Pretty Flacko',171, Artist('A$AP', DATE '2014-02-12', 'HIp Hop','Always Strive And Prosper'))
));

INSERT INTO CurrentlyPlaying VALUES ('cp003',MusicListener('ml001','GloriaM12'),SongsNestType(
    Song('Jong Xina001001','Xuehua',256, Artist('Jong Xina', DATE '2012-02-12', 'Experimental','Representing the Republic'))
));





--     *****************        INSERT INTO PLAYLISTS      *****************

INSERT INTO Playlists VALUES ('pl001', MusicListener('ml001','GloriaM12'),SongsNestType(
    Song('Liarinth001001','Pygmalion',189, Artist('Liarinth', DATE '2014 -10-10', 'Electronic/Techno/Downtempo','Introducing you to a new world')),
    Song('KanyeWest001001','Yeezus',259, Artist('Kanye West', DATE '2009-02-12', 'HIp Hop','Beyonce had the greatest video of all time'))
),'relaxation');

INSERT INTO Playlists VALUES ('pl002', MusicListener('ml002','JustinTime99'),SongsNestType(
    Song('Jong Xina001001','Xuehua',256, Artist('Jong Xina', DATE '2012-02-12', 'Experimental','Representing the Republic')),
    Song('KanyeWest001002','Yeezy210',259, Artist('Kanye West', DATE '2009-02-12', 'HIp Hop','Beyonce had the greatest video of all time')),
    Song('A$AP001001','Pretty Flacko',171, Artist('A$AP', DATE '2014-02-12', 'HIp Hop','Always Strive And Prosper'))
),'hype');

INSERT INTO Playlists VALUES ('pl003', MusicListener('ml001','GloriaM12'),SongsNestType(
    Song('KanyeWest001003','Yeezy840',259, Artist('Kanye West', DATE '2009-02-12', 'HIp Hop','Beyonce had the greatest video of all time'))
),'chilling');

INSERT INTO Playlists VALUES ('pl004', MusicListener('ml003','Goblinslayer22'),SongsNestType(
    Song('Liarinth001003','Western Digital',324, Artist('Liarinth', DATE '2014 -10-10', 'Electronic/Techno/Downtempo','Introducing you to a new world')),
    Song('Liarinth001002','Vesper',259, Artist('Liarinth', DATE '2014 -10-10', 'Electronic/Techno/Downtempo','Introducing you to a new world')),
    Song('KanyeWest001001','Yeezus',259, Artist('Kanye West', DATE '2009-02-12', 'HIp Hop','Beyonce had the greatest video of all time')),
    Song('A$AP001002','Peso',196, Artist('A$AP', DATE '2014-02-12', 'HIp Hop','Always Strive And Prosper'))
),'workout');

INSERT INTO Playlists VALUES ('pl005', MusicListener('ml002','JustinTime99'),SongsNestType(
    Song('KayRab001002','Dissolve',259, Artist('KayRab', DATE '2015-02-12', 'Experimental','A young and upcoming producer that likes to play around with new sound')),
    Song('KayRab001001','Kaboom',259, Artist('KayRab', DATE '2015-02-12', 'Experimental','A young and upcoming producer that likes to play around with new sound'))
),'chilling');




--   *********************   JOINS ************************

SELECT playlists.name, currentlyplaying.id, playlists.songs
from playlists 
INNER JOIN currentlyplaying 
on playlists.id  != 'pl002'
left JOIN playlists 
on playlists.id  = 'pl001'
RIGHT JOIN currentlyplaying
on currentlyplaying.owner  = playlists.owner;



--   *********************   OLUP ************************

SELECT 
    songs.title, SUM(duration)
FROM
    songs
GROUP BY ROLLUP (songs.title);



show ERRORS
/
commit;