using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Ace.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/Demo")]
    public class DemoController : Controller
    {
        [HttpPost]
        [Route("insert")]
        public IActionResult Insert(user model)
        {
            model.id=2;
            model.name = "修改1";
            return Json(model);
        }
        [HttpGet]
        [Route("get")]
        public IActionResult Get()
        {
            user model = new user() {id=1,name="张三" };
            return Json(model);
        }
    }
    public class user
    {
        public int id { get; set; }
        public string name { get; set; }
    }
}