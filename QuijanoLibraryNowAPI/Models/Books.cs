namespace QuijanoLibraryNowAPI.Models
{
    public class Book
    {
        public int Id { get; set; }
        public String? Title { get; set; }
        public String? Author { get; set; }
        public String? Genre { get; set; }
        public bool Available { get; set; }
        public int PublishedYear { get; set; }
    }
}


