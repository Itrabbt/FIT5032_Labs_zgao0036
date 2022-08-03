using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace FIT5032_Week08A.Models
{
    public partial class FileModels : DbContext
    {
        public FileModels()
            : base("name=FileModels")
        {
        }

        public virtual DbSet<File> Files { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<File>()
                .Property(e => e.Path)
                .IsUnicode(false);

            modelBuilder.Entity<File>()
                .Property(e => e.Name)
                .IsUnicode(false);
        }
    }
}
