using Microsoft.AspNetCore.Http;
using System;

namespace MCQ.Models.Other
{
    public class TimerModel
    {
        // Định nghĩa thuộc tính Timeout để lưu thời gian kết thúc của đồng hồ đếm ngược.
        public DateTime Timeout { get; }

        // Constructor để thiết lập giá trị cho Timeout
        public TimerModel(TimeSpan duration)
        {
            Timeout = DateTime.Now.Add(duration);
        }

        // Đây là constructor mặc định, nếu bạn không truyền giá trị duration, mặc định là 2 phút.
        public TimerModel() : this(TimeSpan.FromMinutes(2))
        {
        }

        // Định nghĩa phương thức GetRemainingTime để tính toán thời gian còn lại của đồng hồ đếm ngược.
        public (int hours, int minutes, int seconds) GetRemainingTime(ISession session)
        {
            // Kiểm tra xem có dữ liệu timeout trong session không và nếu còn hiệu lực.
            if (DateTime.TryParse(session.GetString("timeout"), out DateTime timeout) && DateTime.Now < timeout)
            {
                // Tính toán thời gian còn lại bằng cách lấy hiệu của thời gian timeout và thời gian hiện tại.
                TimeSpan remainingTime = timeout - DateTime.Now;
                // Trả về tuple chứa giờ, phút và giây còn lại.
                return (remainingTime.Hours, remainingTime.Minutes, remainingTime.Seconds);
            }

            // Trả về giá trị mặc định nếu không có dữ liệu timeout trong session hoặc timeout đã hết hiệu lực.
            return (0, 0, 0);
        }
    }
}
