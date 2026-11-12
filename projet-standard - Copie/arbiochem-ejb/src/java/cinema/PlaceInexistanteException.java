package cinema;

/** La place n'existe pas dans le plan de la salle (rangee ou numero hors plan). */
public class PlaceInexistanteException extends PlaceException {
    public PlaceInexistanteException(String idSeance, String place, String salle) {
        super("La place " + place + " n'existe pas dans la salle \u00ab " + salle + " \u00bb", idSeance, place);
    }
}
