using System.ComponentModel.DataAnnotations;

namespace Ace.Users.Dto
{
    public class ChangeUserLanguageDto
    {
        [Required]
        public string LanguageName { get; set; }
    }
}