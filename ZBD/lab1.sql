-- ZAD1
-- Zadeklaruj zmienne vTekst i vLiczba o wartościach odpowiednio „Witaj, świecie!” i 1000.456.
-- Następnie wyświetl na konsoli wartości tych zmiennych.
DECLARE
    vText STRING(100) := 'witaj, świecie!';
    vLiczba FLOAT := 1000.256;
BEGIN
    DBMS_OUTPUT.PUT_LINE(vText);
    DBMS_OUTPUT.PUT_LINE(vLiczba);
END;

--ZAD2
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

--ZAD3
-- Napisz program dodający do siebie dwie liczby. Liczby, które mają być do siebie dodane, powinny być
-- podawane za pomocą odpowiednio zainicjalizowanych zmiennych.
DECLARE
    liczba1 FLOAT := 10.2356000;
    liczba2 FLOAT := 0.0000001;
BEGIN
     DBMS_OUTPUT.PUT_LINE('Wynik dodawania: ' || liczba1 || ' + ' || liczba2 || ' = ' || (liczba1 + liczba2));
END;

-- ZAD4
-- Napisz program, który oblicza pole powierzchni koła i obwód koła o podanym w zmiennej promieniu.
-- W programie posłuż się zdefiniowaną przez siebie stałą cPI o wartości 3.14.
DECLARE
    cPI FLOAT := 3.14;
    promien FLOAT := 5;
BEGIN
     DBMS_OUTPUT.PUT_LINE('Obwód koła o promieniu równym 5: ' || 2*cPI*promien);
     DBMS_OUTPUT.PUT_LINE('Pole koła o promieniu równym 5:' || cPI*promien**2);
END;

--ZAD5
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