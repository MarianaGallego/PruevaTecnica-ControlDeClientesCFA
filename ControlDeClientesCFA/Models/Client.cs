using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ControlDeClientesCFA.Models
{
    public class Client
    {
        public long Code { get; set; }
        public string IdType { get; set; }
        [Required]
        public long IdNumber { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string FirstSurname { get; set; }
        public string SecondSurname { get; set; }
        [Required]
        public string Gender { get; set; }
        [Required]
        public DateTime BirthDate { get; set; }
        public string HomeAddress { get; set; }
        public string WorkAddress { get; set; }
        public long PersonalPhoneNumber { get; set; }
        public long HomePhoneNumber { get; set; }
        public long WorkPhoneNumber { get; set; }
        public string Email { get; set; }
    }
}