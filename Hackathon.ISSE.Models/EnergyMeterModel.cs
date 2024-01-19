namespace Hackathon.ISSE.Models;

public class EnergyMeterModel
{
    public int Id { get; set; }
    public string EAN { get; set; }
    public LocationModel Location { get; set; }
}
