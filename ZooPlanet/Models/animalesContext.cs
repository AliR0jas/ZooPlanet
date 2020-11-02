using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ZooPlanet.Models
{
    public partial class animalesContext : DbContext
    {
        public animalesContext()
        {
        }

        public animalesContext(DbContextOptions<animalesContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Clase> Clase { get; set; }
        public virtual DbSet<Especies> Especies { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySql("server=localhost;port=3306;database=animales;uid=root; password=root");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Clase>(entity =>
            {
                entity.ToTable("clase");

                entity.Property(e => e.Id).HasColumnType("int(11)");

                entity.Property(e => e.Descripcion).HasColumnType("text");

                entity.Property(e => e.Nombre).HasColumnType("varchar(45)");
            });

            modelBuilder.Entity<Especies>(entity =>
            {
                entity.ToTable("especies");

                entity.HasIndex(e => e.IdClase)
                    .HasName("fk_especie_clase_idx");

                entity.Property(e => e.Id).HasColumnType("int(11)");

                entity.Property(e => e.Especie)
                    .IsRequired()
                    .HasColumnType("varchar(45)");

                entity.Property(e => e.Habitat).HasColumnType("varchar(45)");

                entity.Property(e => e.IdClase).HasColumnType("int(11)");

                entity.Property(e => e.Observaciones).HasColumnType("varchar(100)");

                entity.Property(e => e.Peso).HasColumnType("double(7,2)");

                entity.Property(e => e.Tamaño).HasColumnType("int(11)");

                entity.HasOne(d => d.IdClaseNavigation)
                    .WithMany(p => p.Especies)
                    .HasForeignKey(d => d.IdClase)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_especie_clase");
            });
        }
    }
}
