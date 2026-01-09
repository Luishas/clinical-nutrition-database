using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NutritionalClinicAPI.Data;
using NutritionalClinicAPI.Models;

namespace NutritionalClinicAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AppointmentController : ControllerBase
    {
        private readonly ClinicContext _context;
        public AppointmentController (ClinicContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Appointment>>> GetAppointments()
        {
            return await _context.Appointments.ToListAsync();
        }
    }
}

