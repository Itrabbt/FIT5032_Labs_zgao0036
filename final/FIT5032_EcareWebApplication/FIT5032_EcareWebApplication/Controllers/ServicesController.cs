using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FIT5032_EcareWebApplication.Models;

namespace FIT5032_EcareWebApplication.Controllers
{
    public class ServicesController : Controller
    {
        private FIT5032_EcareModelContainer db = new FIT5032_EcareModelContainer();

        // GET: Services
        public ActionResult Index()
        {
            var serviceSet = db.ServiceSet.Include(s => s.Customer).Include(s => s.Doctor);
            return View(serviceSet.ToList());
        }

        // GET: Services/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Service service = db.ServiceSet.Find(id);
            if (service == null)
            {
                return HttpNotFound();
            }
            return View(service);
        }

        // GET: Services/Create
        public ActionResult Create()
        {
            ViewBag.Customer_id = new SelectList(db.CustomerSet, "id", "name");
            ViewBag.Doctor_id = new SelectList(db.DoctorSet, "id", "doctorName");
            return View();
        }

        // POST: Services/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,price,content,score,date,Customer_id,Doctor_id")] Service service)
        {
            if (ModelState.IsValid)
            {
                db.ServiceSet.Add(service);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Customer_id = new SelectList(db.CustomerSet, "id", "name", service.Customer_id);
            ViewBag.Doctor_id = new SelectList(db.DoctorSet, "id", "doctorName", service.Doctor_id);
            return View(service);
        }

        // GET: Services/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Service service = db.ServiceSet.Find(id);
            if (service == null)
            {
                return HttpNotFound();
            }
            ViewBag.Customer_id = new SelectList(db.CustomerSet, "id", "name", service.Customer_id);
            ViewBag.Doctor_id = new SelectList(db.DoctorSet, "id", "doctorName", service.Doctor_id);
            return View(service);
        }

        // POST: Services/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,price,content,score,date,Customer_id,Doctor_id")] Service service)
        {
            if (ModelState.IsValid)
            {
                db.Entry(service).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Customer_id = new SelectList(db.CustomerSet, "id", "name", service.Customer_id);
            ViewBag.Doctor_id = new SelectList(db.DoctorSet, "id", "doctorName", service.Doctor_id);
            return View(service);
        }

        // GET: Services/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Service service = db.ServiceSet.Find(id);
            if (service == null)
            {
                return HttpNotFound();
            }
            return View(service);
        }

        // POST: Services/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Service service = db.ServiceSet.Find(id);
            db.ServiceSet.Remove(service);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
