# Sasso Carta e Forbice

## `LoginPage`

La classe `LoginPage` è una `StatefulWidget` che rappresenta la pagina di login dell'applicazione. Questa classe è composta da un `AppBar` personalizzato e da un `SingleChildScrollView` con i seguenti elementi:
- un'immagine;
- un campo di testo per inserire il nome utente;
- un campo di testo per inserire la lunghezza del gioco;
- un pulsante "GIOCA".

## `User`

La classe `User` rappresenta l'utente dell'applicazione e ha due proprietà:
- `username`: una stringa che rappresenta il nome utente;
- `gameLength`: un intero che rappresenta la lunghezza del gioco.

## `GamePage`

La classe `GamePage` è una `StatefulWidget` che rappresenta la pagina di gioco dell'applicazione. Questa classe è composta da un `AppBar` personalizzato e da un `Column` con i seguenti elementi:
- un indicatore del round corrente;
- l'immagine scelta dall'utente;
- l'immagine scelta dal computer;
- un pulsante "SASSO", "CARTA" o "FORBICE";
- un pulsante per visualizzare il punteggio.

## `ScoreBoard`

La classe `ScoreBoard` è una `StatefulWidget` che rappresenta la pagina di punteggio dell'applicazione. Questa classe è composta da un `AppBar` personalizzato e da un `Card` con il punteggio corrente, rappresentato da due interi separati da due punti.