package ferme.lot;

/** Lot eligible for a transfer, with the number of conforming chicks available. */
public class LotTransfertDisponible extends Lot {
    private double capacite;
    private int disponible;

    public LotTransfertDisponible() throws Exception {
        setNomTable("LOT_TRANSFERT_DISPONIBLE_LIB");
    }

    public double getCapacite() {
        return capacite;
    }

    public void setCapacite(double capacite) {
        this.capacite = capacite;
    }

    public int getDisponible() {
        return disponible;
    }

    public void setDisponible(int disponible) {
        this.disponible = disponible;
    }

    public String getCapaciteLibelle() {
        return "capacite: " + Math.round(capacite) + " - " + (disponible == 1 ? "disponible" : "deja utilise");
    }

    @Override
    public String[] getValMotCles() {
        return new String[]{"nomlot", "capaciteLibelle"};
    }
}
