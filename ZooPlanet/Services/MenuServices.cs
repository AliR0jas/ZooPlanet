using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZooPlanet.Models;
using ZooPlanet.Repositories;

namespace ZooPlanet.Services
{
	public class MenuServices
	{
		public IEnumerable<Clase> Clases { get; private set; }

		public MenuServices()
		{
			using (animalesContext ctx = new animalesContext())
			{
				ClasesRepository repository = new ClasesRepository(ctx);
				Clases = repository.GetAll().ToList();
			}
		}
	}
}
