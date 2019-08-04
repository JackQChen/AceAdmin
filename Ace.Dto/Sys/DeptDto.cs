namespace Ace.Dto
{
    public class DeptDto
    {
        public int DeptID { get; set; }
        public string DeptName { get; set; }
        public int ParentID { get; set; }
        public string ParentName { get; set; }
        public string Code { get; set; }
        public int Sort { get; set; }
    }
}
