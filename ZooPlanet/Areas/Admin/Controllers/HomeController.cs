using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using ZooPlanet.Models;
using ZooPlanet.Models.ViewModels;
using ZooPlanet.Repositories;

namespace ZooPlanet.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : Controller
    {
        public IWebHostEnvironment Environment { get; set; }
        animalesContext context;
        public HomeController(animalesContext ctx, IWebHostEnvironment env)
        {
            context = ctx;
            Environment = env;
        }
        public IActionResult Index()
        {
            EspeciesRepository repos = new EspeciesRepository(context);

            return View(repos.GetAll());
        }
        public IActionResult Agregar()
        {
            AnimalesViewModel vm = new AnimalesViewModel();
            ClasesRepository clasesRepository = new ClasesRepository(context);
            vm.Animales = clasesRepository.GetAll();
            return View(vm);
        }
        [HttpPost]
        public IActionResult Agregar(AnimalesViewModel vm)
        {
            try
            {
                EspeciesRepository repos = new EspeciesRepository(context);
                repos.Insert(vm.Especies);

                return RedirectToAction("Index", "Home", new { area = "Admin" });
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                ClasesRepository claseRepo = new ClasesRepository(context);

                vm.Animales = claseRepo.GetAll();
                return View(vm);

            }
        }
        public IActionResult Editar(int id)
        {
            AnimalesViewModel vm = new AnimalesViewModel();
            EspeciesRepository especiesRepository = new EspeciesRepository(context);
            ClasesRepository clasesRepository = new ClasesRepository(context);
            vm.Especies = especiesRepository.GetById(id);

            if (vm.Especies == null)
            {
                return RedirectToAction("Index", "Home", new { area = "Admin" });
            }
            vm.Animales = clasesRepository.GetAll();
            return View(vm);
        }
        [HttpPost]
        public IActionResult Editar(AnimalesViewModel vm)
        {
            try
            {
                EspeciesRepository repos = new EspeciesRepository(context);
                var es = repos.GetById(vm.Especies.Id);
                if (es != null)
                {
                    es.Especie = vm.Especies.Especie;
                    es.IdClase = vm.Especies.IdClase;
                    es.Habitat = vm.Especies.Habitat;
                    es.Observaciones = vm.Especies.Observaciones;
                    es.Tamaño = vm.Especies.Tamaño;
                    es.Peso = vm.Especies.Peso;
                    repos.Update(es);
                }
                return RedirectToAction("Index", "Home", new { area = "Admin" });
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                ClasesRepository clasesRepository = new ClasesRepository(context);
                vm.Animales = clasesRepository.GetAll();
                return View(vm);
            }
        }
        public IActionResult Eliminar(int id)
        {
            EspeciesRepository repos = new EspeciesRepository(context);

            return View(repos.GetById(id));
        }
        [HttpPost]
        public IActionResult Eliminar(Especies esp) 
        {
            EspeciesRepository repos = new EspeciesRepository(context);
            var especies = repos.GetById(esp.Id);

            if (especies!=null)
            {
                repos.Delete(especies);
                return RedirectToAction("Index", "Home", new { area = "Admin" });
            }
            else
            {
                ModelState.AddModelError("", "La especie no existe o ya fue sido eliminado");
                return View(especies);
            }
        }
        public IActionResult Imagen(int id)
        {
            EspeciesRepository repos = new EspeciesRepository(context);
            AnimalesViewModel vm = new AnimalesViewModel();

            vm.Especies = repos.GetById(id);

            if (System.IO.File.Exists(Environment.WebRootPath + $"/especies/{vm.Especies.Id}.jpg"))
            {
                vm.Imagen = vm.Especies.Id + ".jpg";
            }
            else
            {
                vm.Imagen = "no-disponible.png";
            }

            return View(vm);
        }
        [HttpPost]
        public IActionResult Imagen(AnimalesViewModel vm)
        {

            try
            {
                if (vm.Archivo.ContentType != "image/jpeg" || vm.Archivo.Length > 1024 * 1024 * 2)
                {
                    ModelState.AddModelError("", "Debe seleccionar un archivo jpg/png menor a 2MB");
                    if (System.IO.File.Exists(Environment.WebRootPath + $"/especies/{vm.Especies.Id}.jpg"))
                    {
                        vm.Imagen = vm.Especies.Id + ".jpg";
                    }
                    else
                    {
                        vm.Imagen = "no-disponible.png";
                    }
                    return View(vm);
                }
                EspeciesRepository repos = new EspeciesRepository(context);
                var especie = repos.GetById(vm.Especies.Id);

                if (especie != null && vm.Archivo != null)
                {
                    FileStream fs = new FileStream(Environment.WebRootPath + "/especies/" + vm.Especies.Id + ".jpg", FileMode.Create);
                    vm.Archivo.CopyTo(fs);
                    fs.Close();
                }


                return RedirectToAction("Index", "Home", new { area = "Admin" });
            }
            catch (Exception ex)
            {

                ModelState.AddModelError("", ex.Message);

                return View(vm.Especies.Id);
            }
        }
    }
}
