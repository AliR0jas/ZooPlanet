using System;
using System.Collections.Generic;

namespace ZooPlanet.Models
{
    public partial class Especies
    {
        public int Id { get; set; }
        public string Especie { get; set; }
        public int IdClase { get; set; }
        public string Habitat { get; set; }
        public double? Peso { get; set; }
        public int? Tamaño { get; set; }
        public string Observaciones { get; set; }

        public virtual Clase IdClaseNavigation { get; set; }
    }
}
