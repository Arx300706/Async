package cinema;

/**
 * La place demandee est deja occupee pour cette seance
 * (reservation creee ou visee qui n'est pas annulee).
 */
public class PlaceDejaPriseException extends PlaceException {
    private final String idReservation;
    private final boolean vendue;

    public PlaceDejaPriseException(String idSeance, String place, String idReservation, boolean vendue) {
        super("La place " + place + " est d\u00e9j\u00e0 " + (vendue ? "vendue" : "r\u00e9serv\u00e9e")
                + " pour cette s\u00e9ance (r\u00e9servation " + idReservation + "). Choisissez une autre place.",
                idSeance, place);
        this.idReservation = idReservation;
        this.vendue = vendue;
    }

    /** Reservation qui occupe deja la place. */
    public String getIdReservation() { return idReservation; }

    /** true si la reservation qui occupe la place est visee (billet vendu), false si seulement creee. */
    public boolean isVendue() { return vendue; }
}
