CREATE TABLE IF NOT EXISTS Ganre (
	Ganre_id INTEGER PRIMARY KEY,
	Ganre_name VARCHAR(50) UNIQUE
);
	
CREATE TABLE IF NOT EXISTS Singer (
	Singer_id INTEGER PRIMARY KEY,
	Singer_name VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS GanreSinger (
	Ganre_id INTEGER REFERENCES Ganre(Ganre_id),
	Singer_id INTEGER REFERENCES Singer(Singer_id),
	CONSTRAINT pk PRIMARY KEY (Ganre_id, Singer_id)
);
	
CREATE TABLE IF NOT EXISTS ALBUM (
	Album_id INTEGER PRIMARY KEY,
	Album_name VARCHAR (100),
	Year INTEGER CHECK (Year=4)
);

CREATE TABLE IF NOT EXISTS AlbumSinger (
	Album_id INTEGER REFERENCES Album(Album_id),
	Singer_id INTEGER REFERENCES Singer(Singer_id),
	CONSTRAINT pk_a PRIMARY KEY (Album_id, Singer_id)
);

CREATE TABLE IF NOT EXISTS Song (
	Song_id INTEGER PRIMARY KEY,
	Song_name VARCHAR(100),
	Long INTEGER,
	Album_id INTEGER REFERENCES Album(Album_id)
);

CREATE TABLE IF NOT EXISTS Collection (
	Collection_id INTEGER PRIMARY KEY,
	Collection_name VARCHAR (100),
	Year INTEGER CHECK (Year=4)
);

CREATE TABLE IF NOT EXISTS CollectionSong (
	Collection_id INTEGER REFERENCES Collection(Collection_id),
	Song_id INTEGER REFERENCES Song(Song_id),
	CONSTRAINT pk_b PRIMARY KEY (Collection_id, Song_id)
);