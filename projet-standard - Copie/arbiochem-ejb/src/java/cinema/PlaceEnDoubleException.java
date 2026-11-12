package cinema;

/** La meme place est demandee deux fois dans la meme reservation. */
public class PlaceEnDoubleException extends PlaceException {
    public PlaceEnDoubleException(String idSeance, String place) {
        super("La place " + place + " est choisie deux fois dans la m\u00eame r\u00e9servation", idSeance, place);
    }
}
