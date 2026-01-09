namespace NutritionalClinicAPI.Models
{
    public class NutriPlan
    {
        public int NutriPlanID { get; set; }
        public int PatientID { get; set; }
        public int NutritionistID { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public required string Goal { get; set; } 
    }
}