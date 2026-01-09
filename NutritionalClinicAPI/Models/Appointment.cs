using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace NutritionalClinicAPI.Models
{
    [Table("Appointment")]
    public class Appointment
    {
        public int AppointmentID { get; set; }
        public int PatientID { get; set; }
        public int NutritionistID { get; set; }
        public DateTime AppointmentDate { get; set; }
        public required string Reason { get; set; }
        public required string Status { get; set; }
    }
}