using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;
using ZooPlanet.Models;

namespace ZooPlanet.Repositories
{
	public class EspeciesRepository : Repository<Especies>
	{

        public EspeciesRepository(animalesContext ctx):base(ctx)
        {

        }


		public override IEnumerable<Especies> GetAll()
		{
			return base.GetAll().OrderBy(x=>x.Especie);
		}

		public IEnumerable<Especies> GetEspeciesByClase(string Id)
		{
			return Context.Especies
				.Include(x => x.IdClaseNavigation)
				.Where(x => x.IdClaseNavigation.Nombre == Id)
				.OrderBy(x => x.Especie);
		}
        public override	Especies GetById(object id)
        {
			return Context.Especies.Include(x => x.IdClaseNavigation).FirstOrDefault(x => x.Id == (int)id);
        }
		public override bool Validate(Especies entidad)
        {
            if (string.IsNullOrWhiteSpace(entidad.Especie))
            {
				throw new Exception("Indique el nombre de la especie.");
            }
			if (string.IsNullOrWhiteSpace(entidad.Habitat))
			{
				throw new Exception("Indique el hábitat de la especie.");
			}
			if (entidad.Peso == null || entidad.Peso <= 0)
			{
				throw new Exception("Indique el peso de la especie.");
			}
			if (entidad.Tamaño == null || entidad.Tamaño <= 0)
			{
				throw new Exception("Indique un tamaño válido de la especie.");
			}
			if (string.IsNullOrWhiteSpace(entidad.Observaciones))
			{
				throw new Exception("Indique observaciones de la especie.");
			}
			if (Context.Especies.Any(x => x.Especie == entidad.Especie && x.Id != entidad.Id))
			{
				throw new Exception("Especie ya registrada con el mismo nombre.");
			}

			if (!Context.Clase.Any(x => x.Id == entidad.IdClase))
			{
				throw new Exception("No existe la clasificación especificada.");
			}
			return true;
		}
	}
}
