/*
Ćwiczenie polega na wykonaniu prostej bazy danych dla księgowości w małej firmie.  
1. Utwórz nową bazę danych nazywając ją firma. 
2. Dodaj schemat o nazwie ksiegowosc.
3. Dodaj cztery tabele: 
	pracownicy(id_pracownika, imie, nazwisko, adres, telefon)  
	godziny(id_godziny, data, liczba_godzin , id_pracownika) 
	pensja(id_pensji, stanowisko, kwota) 
	premia(id_premii, rodzaj, kwota)  
	wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) 

	przyjmując następujące założenia:
		-typy atrybutów mają zostać dobrane tak, aby składowanie danych było optymalne,
		-klucz główny dla każdej tabeli oraz klucze obce tam, gdzie występują powiązania pomiędzy tabelami,
		-opisy/komentarze dla każdej tabeli 
		–użyj polecenia COMMENT 

4. Wypełnij każdą tabelę 10. rekordami.
*/

CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika int PRIMARY KEY NOT NULL, 
	imie char(50) NOT NULL,
	nazwisko char(50) NOT NULL,
	adres char(50),
	telefon int
);
	
CREATE TABLE ksiegowosc.godziny(
	id_godziny int PRIMARY KEY NOT NULL,
	data date NOT NULL,
	liczba_godzin int,
	id_pracownika int NOT NULL
);

CREATE TABLE ksiegowosc.pensja(
	id_pensji int PRIMARY KEY NOT NULL,
	stanowisko char(50),
	kwota float
);

CREATE TABLE ksiegowosc.premia(
	id_premii int PRIMARY KEY NOT NULL,
	rodzaj char(50),
	kwota float
);

CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia int PRIMARY KEY NOT NULL,
	data date NOT NULL,
	id_pracownika int NOT NULL,
	id_godziny int NOT NULL,
	id_pensji int NOT NULL,
	id_premii int
);


ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii);


INSERT INTO ksiegowosc.pracownicy (id_pracownika, Imie, Nazwisko, adres, telefon) VALUES 
(1, 'Tadeusz', 'Chrobak', 'ul. Narutowicza 12 33-100 Tarnów', '125453325'),
(2, 'Ania', 'Maj', 'ul. Pomorska 2 30-318 Kraków', '433784994'), 
(3, 'Ala', 'Makota', 'ul. Czarnowiejska 17c 30-318 Kraków', '832539648'), 
(4, 'Marek', 'Bieniek', 'ul. Hetmańska 40-560 Katowice', '342459144'),
(5, 'Jacek', 'Dukaj', 'ul. Urszulańska 22 33-100 Tarnów', '191912586'),
(6, 'Zdzisław', 'Janowicz', 'ul. Wrocławska 45 30-318 Kraków', '534762726'),
(7, 'Alicja', 'Kozioł', 'ul. Katowicka 12 40-173 Katowice', '153654974'),
(8, 'Janina', 'Niewiadomska', 'ul. Olszyny 5 30-318 Kraków', '438918131'),
(9, 'Kinga', 'Leszczyńska', 'ul. Młyńska 7 30-318 Kraków', '821329829'),
(10, 'Tomasz', 'Sętowski', 'ul. Admiralska 14 42-280 Częstochowa', '838989661');

Insert INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) VALUES
(1,'2023-05-04', 160, 1),
(2,'2023-05-04', 200, 2),
(3, '2023-05-04', 210, 3),
(4, '2023-05-04', 160, 4),
(5, '2023-05-04', 160, 5),
(6, '2023-05-04', 140, 6),
(7, '2023-05-05', 200, 7),
(8, '2023-05-05', 100, 8),
(9, '2023-05-05', 80, 9),
(10, '2023-05-05', 80, 10);

INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) VALUES
(1, 'Główna księgowa', 3000.00),
(2, 'Księgowa', 2000.00),
(3, 'Dyrektor', 4000.00),
(4, 'Informatyk', 2800.00),
(5, 'Ochroniarz', 1150.00),
(6, 'Woźny', 1100.00),
(7, 'Stażysta', 800.00),
(8, 'Koordynator', 2000.00),
(9, 'Sekretarka', 1050.00),
(10, 'Analityk', 2600.00);

INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) VALUES
(1, 'Motywacyjna', 500.00),
(2, 'Motywcyjna 2', 800.00),
(3, 'Uznaniowa', 1500.00),
(4, 'Świąteczna', 800.00),
(5, 'Jubileuszowa 10lat', 2500.00),
(6, 'Jubileuszowa 20lat', 5000.00),
(7, 'Jubileuszowa 30lat', 10000.00) ,
(8, 'Wynikowa 1', 700.00),
(9, 'Wynikowa 2', 1200.00),
(10,'Frekwencyjna', 500.00);

INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES
(1, '2023-04-01', 1, 1, 3, 1),
(2, '2023-04-01', 2, 2, 7, NULL),
(3, '2023-04-01', 3, 3, 3, 3),
(4, '2023-04-01', 4, 4, 1, 10),
(5, '2023-04-01', 5, 5, 9, 5),
(6, '2023-05-01', 6, 6, 10, 7),
(7, '2023-05-01', 7, 7, 2, 2),
(8, '2023-05-01', 8, 8, 4, 2),
(9, '2023-05-01', 9, 9, 8, NULL),
(10, '2023-05-01', 10, 10, 7, NULL);


/*
5. Wykonaj następujące zapytania: 
	a) Wyświetl tylko id pracownika oraz jego nazwisko.
	b) Wyświetl id pracowników, których płaca jest większa niż 1000.
	c) Wyświetl id pracowników nieposiadających premii,których płaca jest większa niż 2000.
	d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’. 
	e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
	f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie.
	g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 –3000PLN.
	h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinachi nie otrzymali premii.S=
	i) Uszereguj pracowników według pensji.
	j) Uszereguj pracowników według pensji i premii malejąco.
	k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.
	l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne).
	m) Policz sumę wszystkich wynagrodzeń.
	f) Policz sumę wynagrodzeń w ramach danego stanowiska.
	
	g) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
	h) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł.
*/

-- a
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;
-- b
SELECT w.id_pracownika FROM ksiegowosc.wynagrodzenie as w 
	JOIN  ksiegowosc.pensja as p ON w.id_pensji = w.id_pensji
	WHERE p.kwota > 1000;
	
-- c
SELECT w.id_pracownika FROM ksiegowosc.wynagrodzenie as w
	LEFT JOIN ksiegowosc.pensja ON pensja.id_pensji = w.id_pensji
	WHERE pensja.kwota >= 2000 AND w.id_premii IS NULL;
	
-- d
SELECT * FROM ksiegowosc.pracownicy WHERE pracownicy.imie LIKE 'J%';

-- e
SELECT nazwisko FROM ksiegowosc.pracownicy WHERE nazwisko like '%n%' and imie LIKE '%a'

-- f
SELECT p.imie, p.nazwisko, (g.liczba_godzin-160) as liczba_nadgodzin FROM ksiegowosc.pracownicy as p
	JOIN ksiegowosc.godziny as g ON g.id_pracownika = p.id_pracownika
	WHERE g.liczba_godzin > 160
	
-- g
SELECT imie, nazwisko, pensja.kwota FROM ksiegowosc.pracownicy as p
	JOIN ksiegowosc.wynagrodzenie as w ON w.id_pracownika = p.id_pracownika
	JOIN ksiegowosc.pensja ON pensja.id_pensji = w.id_pensji
	WHERE pensja.kwota > 1500 and pensja.kwota < 3000
	
-- h
SELECT imie, nazwisko FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.godziny ON godziny.id_pracownika = pracownicy.id_pracownika
	JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	WHERE (godziny.liczba_godzin-160) > 0 and wynagrodzenie.id_premii IS NULL
	
-- i 
SELECT * FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji
	ORDER BY pensja.kwota
	
-- j
SELECT * FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji
	JOIN ksiegowosc.premia ON premia.id_premii = wynagrodzenie.id_premii
	ORDER BY pensja.kwota desc, premia.kwota desc
	
-- k
SELECT count(stanowisko) FROM ksiegowosc.pensja GROUP BY stanowisko

-- l 
SELECT min(kwota), max(kwota), avg(kwota) FROM ksiegowosc.pensja
	GROUP BY stanowisko 
	HAVING stanowisko = 'Informatyk'
	
-- m
SELECT sum(kwota) FROM ksiegowosc.pensja

-- f
SELECT sum(kwota) FROM ksiegowosc.pensja GROUP BY stanowisko

-- g
SELECT stanowisko, count(wynagrodzenie.id_premii) as licba_premii FROM ksiegowosc.wynagrodzenie
	JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji
	GROUP BY pensja.stanowisko
	
	
	JOIN ksiegowosc.premia ON premia.id_premii = premia.id_premii
	
-- h
ALTER TABLE ksiegowosc.wynagrodzenie
DROP CONSTRAINT wynagrodzenie_id_pracownika_fkey;

ALTER TABLE ksiegowosc.wynagrodzenie
ADD CONSTRAINT wynagrodzenie_id_pracownika_fkey
    FOREIGN KEY (id_pracownika)
    REFERENCES ksiegowosc.pracownicy(id_pracownika)
    ON DELETE CASCADE;



DELETE FROM ksiegowosc.pracownicy p
USING ksiegowosc.wynagrodzenie w,
      ksiegowosc.pensja pen
WHERE w.id_pracownika = p.id_pracownika
  AND pen.id_pensji = w.id_pensji
  AND pen.kwota < 1200;
 
 
 
SELECT * FROM ksiegowosc.pensja

------------------------------------------------
/*
Wykorzystując bazę danych stworzoną na poprzednich ćwiczeniach wykonaj następujące polecenia:
a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski
w nawiasie (+48)
b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był myślnikami wg
wzoru: ‘555-222-333’
c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter

d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5
f) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne.
g) wygeneruj raport (zapytanie), które zwróci w wyniki treść wg poniższego szablonu:
*/

-- a
ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon TYPE char(50);

UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT('(48) ', telefon);

SELECT * FROM ksiegowosc.pracownicy;

-- b
UPDATE ksiegowosc.pracownicy 
SET telefon = CONCAT(
				CONCAT(
					CONCAT(SUBSTRING(telefon, 0, 9), '-'),  
				SUBSTRING(telefon, 9, 3), '-'), 
				SUBSTRING(telefon, 12, 3)
			);

SELECT * FROM ksiegowosc.pracownicy;

-- c
SELECT id_pracownika, UPPER(Imie), UPPER(Nazwisko), UPPER(adres), UPPER(telefon)
FROM ksiegowosc.pracownicy
WHERE LENGTH(nazwisko) = (
	SELECT MAX(LENGTH(nazwisko)) FROM ksiegowosc.pracownicy
	
	
-- d
SELECT MD5(imie), MD5(nazwisko), MD5(telefon), MD5(CAST(kwota AS char(50))) FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji;
	
-- e
SELECT * FROM ksiegowosc.pracownicy
	LEFT JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	LEFT JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji
	LEFT JOIN ksiegowosc.premia ON premia.id_premii = wynagrodzenie.id_premii
	
-- f
SELECT 'Pracownik ' || imie ||
	', w dniu ' || CAST(w.data AS char(50)) ||
	'otrzymał pensję całkowitą na kwotę ' || CAST((pen.kwota + pre.kwota) AS char(50)) || 
	', gdzie wynagrodzenie zasadnicze wynosiło:' || CAST(pen.kwota AS char(50)) ||
	', premia: ' || CAST(pre.kwota AS char(50)) ||
	', nadgodziny '
	
	as Raport
	
	FROM ksiegowosc.pracownicy p
	JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika = p.id_pracownika
	JOIN ksiegowosc.pensja pen ON pen.id_pensji = w.id_pensji
	JOIN ksiegowosc.premia pre ON pre.id_premii = w.id_premii
	
------------------------------------------------------
/*
2. Napisz trigger DML, który po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko
tak, aby było napisane dużymi literami.
3. Przygotuj trigger ‘taxRateMonitoring’, który wyświetli komunikat o błędzie, jeżeli nastąpi
zmiana wartości w polu ‘TaxRate’ o więcej niż 30%.
*/
	
	
-- 2
CREATE OR REPLACE FUNCTION upper_nazwisko()
RETURNS TRIGGER AS $$
BEGIN
	NEW.nazwisko := UPPER(NEW.nazwisko);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
	
	
	
CREATE TRIGGER upper_nazwisko BEFORE INSERT OR UPDATE
	ON ksiegowosc.pracownicy
	FOR EACH ROW
	EXECUTE FUNCTION upper_nazwisko();
	
	
INSERT INTO ksiegowosc.pracownicy (id_pracownika, Imie, Nazwisko, adres, telefon) VALUES 
(11, 'Juzefina', 'Chrobak', 'ul. Narutowicza 12 33-100 Tarnów', '125453325'),
(12, 'Antjana', 'Maj', 'ul. Pomorska 2 30-318 Kraków', '433784994');
	
SELECT * FROM ksiegowosc.pracownicy;
	
	
-- 3
CREATE OR REPLACE FUNCTION salary_upadate_error()
RETURNS TRIGGER AS $$
	BEGIN
	 	IF (NEW.kwota > (OLD.kwota + 0.3*OLD.kwota)) OR (NEW.kwota < (OLD.kwota - 0.3*OLD.kwota)) 
			THEN
				RAISE EXCEPTION 'To much money';
		END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
	

CREATE TRIGGER salary_update BEFORE UPDATE
	ON ksiegowosc.pensja
	FOR EACH ROW
	EXECUTE FUNCTION salary_upadate_error() 

UPDATE ksiegowosc.pensja
SET kwota = 10000
	WHERE stanowisko = 'Dyrektor'

SELECT * FROM ksiegowosc.pensja
