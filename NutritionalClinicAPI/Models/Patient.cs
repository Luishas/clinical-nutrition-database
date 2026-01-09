namespace NutritionalClinicAPI.Models
{
    public class Patient
    {
        public int PatientID { get; set; }
        public required string Name { get; set; }
        public required string LastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public required string Gender { get; set; }
        public required string Phone { get; set; }
        public required string Email { get; set; }
    }
}