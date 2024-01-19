namespace Hackathon.ISSE.Models;

/// <summary>
/// Třída v sobě definuje nějakou lokalitu. Tato lokalita je buď spotřebitelem nebo výrobcem elektřiny.
/// </summary>
public class LocationModel
{
    public int Id { get; set; }
    public MemberModel Owner { get; set; }
    public Address Address { get; set; }
    public double Latitude { get; set; }    //zeměpisná šířka
    public double Longitude { get; set; }   //zeměpisná délka
}
