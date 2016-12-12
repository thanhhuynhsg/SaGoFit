using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SaGoFit.Areas.Adminstrator.Controllers
{
    public class HomeController : Controller
    {
        // GET: Adminstrator/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}