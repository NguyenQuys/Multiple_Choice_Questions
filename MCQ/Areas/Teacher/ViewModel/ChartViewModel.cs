using MCQ.Models;

namespace MCQ.Areas.Teacher.ViewModel
{
    public class ChartViewModel
    {
        public List<string> DTBLabels { get; set; }
        public List<double> DTBData { get; set; }
        public List<string> AmountPassedOrFailedLabels { get; set; }
        public List<int> AmountPassedOrFailedData { get; set; }
        public double Deviation { get; set; }
        public bool CheckIfDidTest { get; set; }
    }

}
