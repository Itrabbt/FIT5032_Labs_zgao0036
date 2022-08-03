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
    public class DoctorsController : Controller
    {
        private FIT5032_EcareModelContainer db = new FIT5032_EcareModelContainer();

        // GET: Doctors
        public ActionResult Index()
        {
            var doctorSet = db.DoctorSet.Include(d => d.Hospital);
            return View(doctorSet.ToList());
        }

        // GET: Doctors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Doctor doctor = db.DoctorSet.Find(id);
            if (doctor == null)
            {
                return HttpNotFound();
            }
            return View(doctor);
        }

        // GET: Doctors/Create
        public ActionResult Create()
        {
            ViewBag.Hospital_hospitalId = new SelectList(db.HospitalSet, "hospitalId", "hospitalName");
            return View();
        }

        // POST: Doctors/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "doctorId,doctorName,password,email,description,score,Hospital_hospitalId")] Doctor doctor)
        {
            if (ModelState.IsValid)
            {
                db.DoctorSet.Add(doctor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Hospital_hospitalId = new SelectList(db.HospitalSet, "hospitalId", "hospitalName", doctor.Hospital_hospitalId);
            return View(doctor);
        }

        // GET: Doctors/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Doctor doctor = db.DoctorSet.Find(id);
            if (doctor == null)
            {
                return HttpNotFound();
            }
            ViewBag.Hospital_hospitalId = new SelectList(db.HospitalSet, "hospitalId", "hospitalName", doctor.Hospital_hospitalId);
            return View(doctor);
        }

        // POST: Doctors/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "doctorId,doctorName,password,email,description,score,Hospital_hospitalId")] Doctor doctor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(doctor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Hospital_hospitalId = new SelectList(db.HospitalSet, "hospitalId", "hospitalName", doctor.Hospital_hospitalId);
            return View(doctor);
        }

        // GET: Doctors/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Doctor doctor = db.DoctorSet.Find(id);
            if (doctor == null)
            {
                return HttpNotFound();
            }
            return View(doctor);
        }

        // POST: Doctors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Doctor doctor = db.DoctorSet.Find(id);
            db.DoctorSet.Remove(doctor);
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
