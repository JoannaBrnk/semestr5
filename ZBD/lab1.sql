-- ZAD 1
-- Zadeklaruj zmienne vTekst i vLiczba o wartościach odpowiednio „Witaj, świecie!” i 1000.456.
-- Następnie wyświetl na konsoli wartości tych zmiennych.
DECLARE
    vText STRING(100) := 'witaj, świecie!';
    vLiczba FLOAT := 1000.256;
BEGIN
    DBMS_OUTPUT.PUT_LINE(vText);
    DBMS_OUTPUT.PUT_LINE(vLiczba);
END;

--ZAD 2
-- Do zmiennych, zadeklarowanych w zadaniu 1., dodaj odpowiednio: do zmiennej vTekst wartość „Witaj,
-- nowy dniu!”, do zmiennej vLiczba dodaj wartość (10)^15. Wyświetl wartości tych zmiennych
DECLARE
    vText STRING(100) := 'witaj, świecie!';
    vLiczba FLOAT := 1000.256;
BEGIN
    vText := vText || 'Witaj, nowy dniu!';
    vLiczba := vLiczba + 10**15;
    DBMS_OUTPUT.PUT_LINE(vText);
    DBMS_OUTPUT.PUT_LINE(vLiczba);
END;

--ZAD 3
-- Napisz program dodający do siebie dwie liczby. Liczby, które mają być do siebie dodane, powinny być
-- podawane za pomocą odpowiednio zainicjalizowanych zmiennych.
DECLARE
    liczba1 FLOAT := 10.2356000;
    liczba2 FLOAT := 0.0000001;
BEGIN
     DBMS_OUTPUT.PUT_LINE('Wynik dodawania: ' || liczba1 || ' + ' || liczba2 || ' = ' || (liczba1 + liczba2));
END;

-- ZAD 4
-- Napisz program, który oblicza pole powierzchni koła i obwód koła o podanym w zmiennej promieniu.
-- W programie posłuż się zdefiniowaną przez siebie stałą cPI o wartości 3.14.
DECLARE
    cPI FLOAT := 3.14;
    promien FLOAT := 5;
BEGIN
     DBMS_OUTPUT.PUT_LINE('Obwód koła o promieniu równym 5: ' || 2*cPI*promien);
     DBMS_OUTPUT.PUT_LINE('Pole koła o promieniu równym 5:' || cPI*promien**2);
END;

--ZAD 5
-- Napisz program, który wyświetli poniższe informacje o najlepiej zarabiającym pracowniku Instytutu.
-- Program powinien korzystać ze zmiennych vNazwisko i vEtat o typach identycznych z typami
-- atrybutów, odpowiednio: nazwisko i etat w relacji Pracownicy.
DECLARE
    vNazwisko Pracownicy.nazwisko%TYPE;
    vEtat Pracownicy.etat%TYPE;
BEGIN
    SELECT nazwisko, etat
    INTO vNazwisko, vEtat
    FROM pracownicy
    ORDER BY PLACA_POD DESC
    FETCH first 1 rows only ;
    DBMS_OUTPUT.PUT_LINE('Najlepiej zarabia pracownik ' || vNazwisko);
    DBMS_OUTPUT.PUT_LINE('Pracuje on jako ' || vEtat);
END;

-- ZAD 6
-- Napisz program działający identycznie jak program z zadania poprzedniego, tym razem jednak użyj
-- zmiennych rekordowych.
DECLARE
    TYPE tDane IS RECORD (
    nazwisko VARCHAR(100),
    etat VARCHAR(100));
    vPracownik tDane;
BEGIN
    SELECT nazwisko, etat
    INTO vPracownik
    FROM pracownicy
    ORDER BY PLACA_POD DESC
    FETCH first 1 rows only;
    DBMS_OUTPUT.PUT_LINE('Najlepiej zarabia pracownik ' || vPracownik.nazwisko);
    DBMS_OUTPUT.PUT_LINE('Pracuje on jako ' || vPracownik.etat);
END;

-- ZAD 7
-- Zdefiniuj w oparciu o typ NUMBER własny podtyp o nazwie tPieniadze i zdefiniuj zmienną tego typu.
-- Wczytaj do niej roczne zarobki prof. Słowińskiego.
DECLARE
    vNazwisko Pracownicy.nazwisko%TYPE;
    vPieniadze NUMBER(6, 2);
BEGIN
    SELECT nazwisko, PLACA_POD
    INTO vNazwisko, vPieniadze
    FROM pracownicy
    WHERE NAZWISKO = 'SLOWINSKI';
    DBMS_OUTPUT.PUT_LINE('Pracownik ' || vNazwisko || ' zarabia rocznie ' || vPieniadze*12);
END;

-- ZAD 8
-- Napisz program, który będzie działał tak długo, jak długo nie nadejdzie 25 sekunda dowolnej minuty. Na
-- zakończenie program powinien wypisać na konsoli odpowiedni komunikat.
BEGIN
    LOOP
    IF (EXTRACT(SECOND from (current_timestamp))) = 25 THEN
        DBMS_OUTPUT.PUT_LINE('Nadeszła 25 sekunda!');
        EXIT ;
    END IF;
    END LOOP;
END;

-- ZAD 9
-- Napisz program, który dla podanej w zmiennej wartości n obliczy wartość wyrażenia
-- n! = 1 * 2 * 3 * ... * n
DECLARE
    vSuma NATURAL := 1;
    vLicznik NATURAL := 0;
    vN NATURAL := 10;
BEGIN
    LOOP
    IF vLicznik = vN THEN
    EXIT;
    END IF;
    vLicznik := vLicznik + 1;
    vSuma := vSuma * vLicznik;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(vSuma);
END;

-- ZAD 10
-- Napisz program który wyliczy, kiedy w XXI wieku będą piątki przypadające na 13 dzień miesiąca
DECLARE
    vData date;
    rok number(4,0):= 2020;
    ile number(38, 0):= 0;
BEGIN
    vData:= current_timestamp;
    while rok < 2101
        LOOP
        vData := vData + 1;
        rok := EXTRACT(Year from (vData));
        if (TO_CHAR(vData,'Day') LIKE TO_CHAR(date '2020-10-09', 'Day')) AND (TO_CHAR(vData,'DD') like '13' )THEN
        ile := ile + 1;
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(vData, 'DD-MM-YYYY'));
    end if;
  END LOOP ;
END;