namespace MCQ.Models.Other
{
    public class Mark
    {
        public int IdQuestion { get; set; }
        public int Level { get; set; }
        public bool? IsCorrect { get; set; }
        public int AmountLevel1 { get; set; }
        public int AmountLevel2 { get; set; }
        public int AmountLevel3 { get; set; }
    }
}
