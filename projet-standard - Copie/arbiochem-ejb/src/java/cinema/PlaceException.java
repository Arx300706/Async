package cinema;

/** Erreur sur une place numerotee d'une seance (classe de base). */
public class PlaceException extends Exception {
    private final String idSeance;
    private final String place;

    public PlaceException(String message, String idSeance, String place) {
        super(message);
        this.idSeance = idSeance;
        this.place = place;
    }

    public String getIdSeance() { return idSeance; }
    public String getPlace() { return place; }
}
