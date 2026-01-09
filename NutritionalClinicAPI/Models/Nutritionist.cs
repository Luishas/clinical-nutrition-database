namespace NutritionalClinicAPI.Models
{
    public class Nutritionist
    {
        public int NutritionistID { get; set; }
        public required string Name { get; set; }
        public required string LastName { get; set; }
        public int LicenseNumber { get; set; }
        public required string Phone { get; set; }
        public required string Email { get; set; }
    }
}