namespace NutritionalClinicAPI.Models
{
    public class AuditLog
    {
        public string TableName { get; set; } = null!;
        public int RecordID { get; set; }
        public string Action { get; set; } = null!;
        public string? ChangedBy { get; set; }
        public DateTime ChangeDate { get; set; }
        public string? OldData { get; set; }
        public string? NewData { get; set; }
    }
}