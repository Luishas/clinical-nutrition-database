namespace NutritionalClinicAPI.Models
{
    public class Payment
    {
        public int PaymentID { get; set; }
        public int AppointmentID { get; set; }
        public decimal Amount { get; set; }
        public DateTime PayDate { get; set; }
        public required string PayMethod { get; set; }
        public required string Status { get; set; }
    }
}