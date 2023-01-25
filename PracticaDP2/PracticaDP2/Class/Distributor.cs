using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PracticaDP2.Class
{
    public class Distributor
    {
        public string id { get; set; }
        public string Name { get; set; }
        public string NameFull { get; set; }
        public string FatherLastName { get; set; }
        public string MotherLasName { get; set; }
        public string Street { get; set; }
        public int Number { get; set; }
        public string Neighborhood { get; set; }

        public Distributor()
        {
            this.id = null;
            this.Name = "";
            this.NameFull = "";
            this.FatherLastName = "";
            this.MotherLasName = "";
            this.Street = "";
            this.Number = 0;
            this.Neighborhood = "";
        }
    }
}