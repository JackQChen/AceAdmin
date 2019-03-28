using System;
using System.Collections.Generic;
using System.Text;

namespace Ace.Dto
{
    public class SelectedItemDto
    {
        public int Key { get; set; }
        public string Text { get; set; }
        public int SelectedKey { get; set; }
        public bool IsSelected { get; set; }
    }
}
