using Microsoft.EntityFrameworkCore;
using NutritionalClinicAPI.Models;

namespace NutritionalClinicAPI.Data
{
    public class ClinicContext : DbContext
    {
        public ClinicContext(DbContextOptions<ClinicContext> options)
            : base(options)
        {
        }

        public DbSet<Patient> Patients { get; set; }
        public DbSet<Nutritionist> Nutritionists { get; set; }
        public DbSet<Appointment> Appointments { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<NutriPlan> NutriPlans { get; set; }
        public DbSet<AuditLog> AuditLogs { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AuditLog>().HasNoKey();

            base.OnModelCreating(modelBuilder);
        }
    }
}
